export NODEJS_CHECK_SIGNATURES="no"
ASDF_BREW_PATH=$(brew --prefix asdf)
source $ASDF_BREW_PATH/asdf.sh
source $ASDF_BREW_PATH/etc/bash_completion.d/asdf.bash

eval "$(fasd --init auto)"
eval "$(hub alias -s)"

export FZF_DEFAULT_COMMAND='fd -t f -H -E .git'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-autosuggestions', defer:2
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug load
