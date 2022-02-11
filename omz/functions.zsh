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
