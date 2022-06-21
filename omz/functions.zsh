unset -f rmdsstore

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

function pamtid() {
    if [[ $(grep pam_tid /etc/pam.d/sudo) ]]; then
        echo "pam_tid already enabled"
        return
    fi

    sudo sed -i '' '1 a\
auth       sufficient     pam_tid.so\
' /etc/pam.d/sudo
    echo "pam_tid successfully enabled for sudo"
}

function sgip() {
    groupName="${1:-dev-access-andrei}"

    ipv4=$(curl -4 -s -m 5 icanhazip.com)
    ipv6=$(curl -6 -s -m 5 icanhazip.com)
    ranges=""

    if [ -z $AWS_PROFILE ]; then
        echo "AWS_PROFILE is not set. Exiting..."
        return
    fi

    echo "profile: $AWS_PROFILE"
    echo "ipv4: $ipv4"
    echo "ipv6: $ipv6"

    if [ ! -z "$ipv4" ]; then
        ranges="IpRanges=[{CidrIp=${ipv4}/32}]"
    fi

    if [ ! -z "$ipv6" ]; then
        ranges="${ranges},Ipv6Ranges=[{CidrIpv6=${ipv6}/128}]"
    fi

    if [ -z "$ranges" ]; then
        echo "Could not determine external ip"
        return
    fi

    PAGER=""
    permissions=$(aws ec2 describe-security-groups --output json --group-name $groupName --query "SecurityGroups[0].IpPermissions")

    if [ $(echo $permissions | jq length) -gt 0 ]; then
        echo "Removing existing ingress rules..."
        revoke=$(aws ec2 revoke-security-group-ingress --group-name $groupName --cli-input-json "{\"IpPermissions\": $permissions}")

        if [ $(echo $revoke | jq ".Return") = true ]; then
            echo "Successfully removed ingress rules!"
        else
            echo "Could not remove ingress rules!"
        fi
    fi

    echo "Adding new ingress rules..."
    aws ec2 authorize-security-group-ingress --group-name $groupName --ip-permissions IpProtocol=all,$ranges
}
