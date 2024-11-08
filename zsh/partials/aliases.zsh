# Remove aliases
((${+aliases[ls]})) && unalias ls

# general
alias c="clear"
alias cv="rm ~/.config/nvim/tmp/*"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias mux="tmuxinator"
alias npmsd="npm install --save-dev"
alias psa="ps aux"
alias rl="source ~/.zshrc"
alias ss='open -a ScreenSaverEngine'
alias tf="terraform"
alias v='vim $(fzf --height=25)'

# cargo
alias cb="cargo build"
alias cr="cargo run"
alias crb="cargo run --bin"

# docker
alias db="docker build"
alias dbt="docker build -t"
alias di="docker images"
alias dps="docker ps -a"
alias dr="docker run"
alias dri="docker rmi"
alias drm="docker rm"
alias ds="docker stop"

# docker-compose
alias dcs="docker-compose stop"
alias dcu="docker-compose up"

# git
alias ga="git add -A"
alias gan="git add -AN"
alias gap="git add -p"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend"
alias gcb="git checkout -b"
alias gcf="git commit --fixup"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcv="git commit -v"
alias gd="git diff -w"
alias gdh="git diff -w HEAD"
alias gds="git diff --staged"
alias gf="git ls-files | grep"
alias gg="git grep"
alias gl="git lg"
alias gm="git merge"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gpu="git push"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias grh="git reset HEAD"
alias grhh="git reset HEAD --hard"
alias gri="git rebase -i"
alias grm="git rm"
alias gron="git rebase --onto"
alias grs="git reset --soft"
alias gs="git st"
alias gsa="git stash apply"
alias gsh="git show"
alias gsl="git stash list"
alias gss="git stash show"
alias gst="git status"
alias gt="git tag"
alias gw="git worktree"

# jira
alias jo="jira browse"

# k8s
alias k="kubectl"

# kitty
if ! [[ -z $KITTY_WINDOW_ID ]]; then
    alias icat="kitty +kitten icat"
    alias ssh="kitty +kitten ssh"
fi

# ruby
alias be="bundle exec"
alias ber="be rake"

# music
alias mp="osascript -e 'tell application \"Spotify\" to pause';"
alias ms="osascript -e 'tell application \"Spotify\" to play';"

# suffix aliases
alias -s log='less +F'
alias -s txt='less'
alias -s {css,haml,js,jsx,md,py,rb,zsh}=vim

if [[ -n $SPIN ]]; then
    alias dds="dev debug server"
    alias j="dev cd"
    alias refresh="dev reup && dev restart"
fi
