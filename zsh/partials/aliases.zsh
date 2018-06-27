# general
alias c="clear"
alias cv="rm ~/.config/nvim/tmp/*"
alias j="z"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ls="ls -G -a"
alias mux="tmuxinator"
alias psa="ps aux"
alias rl="source ~/.zshrc"
alias ss='open -a ScreenSaverEngine'
alias v='vim $(fzf)'

# docker
alias dps="docker ps -a"
alias drm="docker rm"
alias drmi="docker rmi"

# git
alias ga="git add -A"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcom="git checkout master"
alias gcp="git cherry-pick"
alias gcv="git commit -v"
alias gd="git diff -w"
alias gdh="git diff -w HEAD"
alias gf="git ls-files | grep"
alias gg="git grep"
alias gl="git lg"
alias gm="git merge"
alias gp="git pull"
alias gpo="git push -u origin"
alias gpr="git pull --rebase"
alias gpu="git push"
alias grh="git reset HEAD"
alias grhh="git reset HEAD --hard"
alias grm="git rm"
alias gs="git st"
alias gsa="git stash apply"
alias gsl="git stash list"
alias gss="git stash show"
alias gst="git status"
alias gt="git tag"
alias gu="git add -u"

# k8s
alias k="kubectl"

# ruby
alias bdbrb="ber db:rollback"
alias be="bundle exec"
alias ber="be rake"
alias berg="be rails g"
alias berm="ber db:migrate"
alias rc="be rails c"
alias rr="be rake routes"
alias rs="be rails s"

# minikube
alias mku="eval $(minikube docker-env)"
alias mkd="eval $(minikube docker-env -u)"

# music
alias mp="osascript -e 'tell application \"Spotify\" to pause';"
alias ms="osascript -e 'tell application \"Spotify\" to play';"

# suffix aliases
alias -s css='vim'
alias -s haml='vim'
alias -s js='vim'
alias -s jsx='vim'
alias -s log='less +F'
alias -s md='vim'
alias -s rb='vim'
alias -s txt='less'
