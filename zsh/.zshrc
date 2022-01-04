disable r

export DOTFILES="$HOME/dotfiles"
export ZSH="$HOME/.oh-my-zsh"

hash -d dotfiles="$DOTFILES"

DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
ZSH_CUSTOM="$DOTFILES/zsh/custom"
ZSH_THEME="bureau-james"
plugins=()

source "$ZSH/oh-my-zsh.sh"
source "$DOTFILES/zsh/partials/exports.zsh"
source "$DOTFILES/zsh/partials/aliases.zsh"
source "$DOTFILES/zsh/partials/functions.zsh"
source "$HOME/.zsh_custom" 2>/dev/null
source "$DOTFILES/zsh/partials/tools.zsh"
