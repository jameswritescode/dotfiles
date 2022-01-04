# asdf
export NODEJS_CHECK_SIGNATURES="no"
ASDF_BREW_PATH=$(brew --prefix asdf)

if [ -f $ASDF_BREW_PATH/asdf.sh ]; then
  source $ASDF_BREW_PATH/asdf.sh
  source $ASDF_BREW_PATH/etc/bash_completion.d/asdf.bash
fi

# fasd
eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"

# fzf
export FZF_DEFAULT_COMMAND='fd -t f -H -E .git'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
