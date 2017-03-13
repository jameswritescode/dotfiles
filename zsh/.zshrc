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

source $(brew --prefix chruby)/share/chruby/chruby.sh

eval "$(fasd --init auto)"
eval "$(hub alias -s)"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# general
alias c="clear"
alias j="z"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias ls="ls -G -a"
alias vim="nvim"
alias vu="nvim +PluginInstall! +UpdateRemotePlugins +qa"

# docker
alias dps="docker ps -a"

# git
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
alias gsa="git stash apply"
alias gu="git add -u"

# ruby
alias be="bundle exec"
alias ber="be rake"
alias bm="bundle && m"
alias m="ber db:migrate && ber db:migrate RAILS_ENV=test"
alias rs="be rails s"

__cd_nvm() {
  [ -f "$PWD/.nvmrc" ] && nvm use . &>/dev/null
}

__cd_chruby() {
  [ -f "$PWD/.ruby-version" ] && chruby `cat .ruby-version` &>/dev/null
}

chpwd_functions=(${chpwd_functions[@]} "__cd_nvm" "__cd_chruby")

source ~/.zsh_custom 2>/dev/null
