# functions

vim() {
  if [ -z ${VIM+x} ]; then
    local params="$*"

    if [[ $params =~ ':' ]]; then
      local file=$params[(ws.:.)1]
      local lineno=$params[(ws.:.)2]

      nvim $file "+$lineno"
    else
      nvim $*
    fi
  else
    echo "Already in vim"
  fi
}

gls() {
  git log -S $* --source --all
}

# chpwd functions

__cd_nvm() {
  [ -f "$PWD/.nvmrc" ] && nvm use . &>/dev/null
}

__cd_nvm

__cd_chruby() {
  [ -f "$PWD/.ruby-version" ] && chruby `cat $PWD/.ruby-version` &>/dev/null
}

__cd_chruby

chpwd_functions=("__cd_nvm" "__cd_chruby")
