# asdf
export NODEJS_CHECK_SIGNATURES="no"

# fzf
export FZF_DEFAULT_COMMAND='fd -t f -H -E .git'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
