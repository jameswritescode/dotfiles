# oh-my-zsh
export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="bureau-james"
DISABLE_AUTO_UPDATE="true"
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# dotfiles
source $DOTFILES/zsh/partials/exports.zsh
source $DOTFILES/zsh/partials/tools.zsh
source $DOTFILES/zsh/partials/aliases.zsh
source $DOTFILES/zsh/partials/functions.zsh
source ~/.zsh_custom 2>/dev/null
