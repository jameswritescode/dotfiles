# general
alias c="clear"
alias j="z"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ls="ls -G -a"
alias mux="tmuxinator"
alias psa="ps aux"
alias v='vim $(fzf)'

# docker
alias dps="docker ps -a"

# git
alias ga="git add -A"
alias gb="git branch"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcom="git checkout master"
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
alias gs="git st"
alias gsa="git stash apply"
alias gsl="git stash list"
alias gss="git stash show"
alias gst="git status"
alias gt="git tag"
alias gu="git add -u"

# ruby
alias be="bundle exec"
alias ber="be rake"
alias bm="bundle && m"
alias m="ber db:migrate && ber db:migrate RAILS_ENV=test"
alias rc="be rails c"
alias rr="be rake routes"
alias rs="be rails s"

# music
alias mp="osascript -e 'tell application \"Spotify\" to pause';"
alias ms="osascript -e 'tell application \"Spotify\" to play';"
