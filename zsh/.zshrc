export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="bureau-james"
DISABLE_AUTO_UPDATE="true"
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export BUNDLE_EDITOR="nvim"
export EDITOR="nvim"
export GOPATH="$HOME/go"
export HISTCONTROL=ignoreboth:erasedups
export NVM_DIR="$HOME/.nvm"
export VIRTUAL_ENV_DISABLE_PROMPT="true"
export FZF_DEFAULT_COMMAND='ag -g ""'

source $(brew --prefix chruby)/share/chruby/chruby.sh

eval "$(fasd --init auto)"
eval "$(hub alias -s)"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# general
alias c="clear"
alias j="z"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ls="ls -G -a"
alias mux="tmuxinator"

# docker
alias dps="docker ps -a"

# git
alias ga="git add -A"
alias gb="git branch"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcom="git checkout master"
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
alias gs="git st"
alias gsa="git stash apply"
alias gsl="git stash list"
alias gss="git stash show"
alias gst="git status"
alias gu="git add -u"
alias grh="git reset HEAD"

# ruby
alias be="bundle exec"
alias ber="be rake"
alias bm="bundle && m"
alias m="ber db:migrate && ber db:migrate RAILS_ENV=test"
alias rc="be rails c"
alias rs="be rails s"

# functions

vim() {
  if [ -z ${VIM+x} ]; then
    nvim $*
  else
    echo "Already in vim"
  fi
}

# chpwd functions

__cd_nvm() {
  [ -f "$PWD/.nvmrc" ] && nvm use . &>/dev/null
}

__cd_nvm

__cd_chruby() {
  [ -f "$PWD/.ruby-version" ] && chruby `cat .ruby-version` &>/dev/null
}

__cd_chruby

chpwd_functions=("__cd_nvm" "__cd_chruby")

source ~/.zsh_custom 2>/dev/null
