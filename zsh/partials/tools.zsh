source $(brew --prefix chruby)/share/chruby/chruby.sh

eval "$(fasd --init auto)"
eval "$(hub alias -s)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export FZF_DEFAULT_COMMAND='fd --type f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-autosuggestions', defer:2
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug load
