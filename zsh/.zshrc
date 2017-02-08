export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="bureau-james"
DISABLE_AUTO_UPDATE="true"
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export BUNDLE_EDITOR="vim"
export EDITOR="vim"
export GOPATH="$HOME/go"
export HISTCONTROL=ignoreboth:erasedups
export NVM_DIR="$HOME/.nvm"
export VIRTUAL_ENV_DISABLE_PROMPT="true"

alias be="bundle exec"
alias ber="bundle exec rake"
alias bm="bundle && m"
alias c="clear"
alias dps="docker ps -a"
alias ga="git add -A"
alias gb="git branch"
alias gco="git checkout"
alias gd="git diff"
alias gf="git ls-files | grep"
alias gg="git grep"
alias gl="git lg"
alias gm="git merge"
alias gp="git pull"
alias gpo="git push -u origin"
alias gpr="git pull --rebase"
alias gpu="git push"
alias gs="git st"
alias gu="git add -u"
alias j="z"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ls="ls -G -a"
alias m="rake db:migrate && rake db:migrate RAILS_ENV=test"
alias rs="bundle exec rails s"
alias vu="vim +PluginInstall! +qa"

__cd_nvm () {
  [ -f "$PWD/.nvmrc" ] && nvm use . &>/dev/null
}

chpwd_functions=(${chpwd_functions[@]} "__cd_nvm")

source ~/.zsh_custom 2>/dev/null
