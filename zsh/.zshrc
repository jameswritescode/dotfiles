export DOTFILES="$HOME/dotfiles"

hash -d dotfiles="$DOTFILES"

source "$DOTFILES/zsh/partials/compatibility.zsh"

if [ -f "$HOME/.df-omz-migration" ]; then
    source "$DOTFILES/zsh/.zshrc-minus-omz"
else
    source "$DOTFILES/zsh/.zshrc-omz"
fi

source "$HOME/.zsh_custom" 2>/dev/null
source "$DOTFILES/zsh/partials/exports.zsh"
source "$DOTFILES/zsh/partials/aliases.zsh"
source "$DOTFILES/zsh/partials/functions.zsh"
