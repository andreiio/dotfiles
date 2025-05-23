# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:~/.config/phpmon/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to .zcompdump files.
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Enable completions
autoload -Uz compinit && compinit

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

setopt HIST_IGNORE_SPACE

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES/omz

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    1password
    artisan
    aliases
    aws
    brew
    common-aliases
    composer
    docker
    docker-compose
    doctl
    encode64
    extract
    gh
    git
    git-extras
    gitfast
    gpg-agent
    kubectl
    laravel
    macos
    npm
    nvm
    tailscale
    terraform
    vscode
)

# Plugins config
zstyle ':omz:plugins:nvm' autoload yes

source $ZSH/oh-my-zsh.sh

# User configuration

export COMPOSER_MEMORY_LIMIT=-1

export GPG_TTY=$(tty)

export HOMEBREW_CASK_OPTS="--no-quarantine"
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_SORBET_RUNTIME=false
#export HOMEBREW_NO_SORBET_RUNTIME=1
#export HOMEBREW_DEVELOPER=0

export SHOW_AWS_PROMPT=true
export ZSH_THEME_AWS_DIVIDER=" "

export RPROMPT='$(aws_prompt_info) $(tf_prompt_info)'

# Preferred editor
export EDITOR='vim'
export ARTISAN_OPEN_ON_MAKE_EDITOR="code"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(atuin init zsh --disable-up-arrow)"

export SSH_AUTH_SOCK=~/.1password/agent.sock

# pnpm
export PNPM_HOME="/Users/andrei/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
