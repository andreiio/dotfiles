# Shortcuts
alias o="open"
alias oo="open ."

# Directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/Projects"

# git
alias nah="git reset --hard HEAD && git clean -fd"

# php
alias ct="composer test"
alias sail="bash vendor/bin/sail"
alias fresh="php artisan migrate:fresh --seed"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Hide/show all desktop icons
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Frequent typos
alias sl="ls"

# Rosetta
alias x86="arch --x86_64"
