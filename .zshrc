ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bureau-james"
DISABLE_AUTO_TITLE=true

plugins=(nyan zsh-syntax-highlighting)

[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc
[[ -s $HOME/.rvm/scripts/rvm ]]       && . "$HOME/.rvm/scripts/rvm"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source $ZSH/oh-my-zsh.sh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

eval "$(fasd --init auto)"
eval "$(/Users/james/projects/zaphyous/sub-zaph/bin/zaph init -)"

alias j="z"
alias ls="ls -G -a"
alias mime="file --mime-type -b"
alias c="clear"
alias r="ruby"
alias m="rake db:migrate; rake db:test:prepare"
alias be="nocorrect bundle exec"
alias ber="nocorrect bundle exec rake"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ccat="pygmentize -O style=monokai -f console256 -g"
alias off="pmset sleepnow"
alias git="nocorrect git"
alias rvm="nocorrect rvm"
alias popen="powify open"
alias prestart="powify restart"

# Customize to your needs...
#export PATH=/usr/local/bin:/usr/local/sbin:/Users/james/pear/bin:/Users/james/wrk/bin:/Users/james/.rbenv/shims:/Users/james/.rvm/gems/ruby-1.9.3-p286-perf/bin:/Users/james/.rvm/gems/ruby-1.9.3-p286-perf@global/bin:/Users/james/.rvm/rubies/ruby-1.9.3-p286-perf/bin:/Users/james/.rvm/bin:/Users/james/.pythonbrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/james/projects/zaphyous/sub-zaph/bin
export PATH=$(brew --prefix homebrew/php/php56)/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/sbin:/Users/james/pear/bin:$PATH
#export TERM="xterm-256color"
export EDITOR="vim"
export BUNDLE_EDITOR="vim"
# export RUBY_HEAP_MIN_SLOTS=800000
# export RUBY_HEAP_FREE_MIN=100000
# export RUBY_HEAP_SLOTS_INCREMENT=300000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=79000000

# Add the following to your ~/.bashrc or ~/.zshrc
#
# Alternatively, copy/symlink this file and source in your shell.  See `hitch --setup-path`.

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# Uncomment to persist pair info between terminal instances
# hitch

archey -c
