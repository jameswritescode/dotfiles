# functions

vim() {
  if [ -z ${VIM+x} ]; then
    nvim $*
  else
    echo "Already in vim"
  fi
}

# chpwd functions

__cd_nvm() {
  [ -f "$PWD/.nvmrc" ] && nvm use . &>/dev/null
}

__cd_nvm

__cd_chruby() {
  [ -f "$PWD/.ruby-version" ] && chruby `cat .ruby-version` &>/dev/null
}

__cd_chruby

chpwd_functions=("__cd_nvm" "__cd_chruby")
