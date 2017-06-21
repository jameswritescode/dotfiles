export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="bureau-james"
DISABLE_AUTO_UPDATE="true"
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export BUNDLE_EDITOR="nvim"
export EDITOR="nvim"
export GOPATH="$HOME/go"
export HISTCONTROL="ignoreboth:erasedups"
export HISTSIZE=500000
export SAVEHIST=500000
export VIRTUAL_ENV_DISABLE_PROMPT="true"
export DOTFILES="$HOME/dotfiles"

source $DOTFILES/zsh/partials/tools.zsh
source $DOTFILES/zsh/partials/aliases.zsh
source $DOTFILES/zsh/partials/functions.zsh
source ~/.zsh_custom 2>/dev/null
