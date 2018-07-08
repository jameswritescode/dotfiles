# functions

vim() {
  if [[ -z $VIM ]]; then
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

fk() {
  ps aux | grep $* | grep -v grep | awk '{print $2}' | xargs kill -9
}

gcm() {
  if [[ -z $1 ]]; then
    echo "Error: No commit message provided."
    return 1
  fi

  local ticket=$(git rev-parse --abbrev-ref HEAD | egrep -o "ENG-\d+")

  if [[ -n "$ticket" ]]; then
    git commit -m "[$ticket] $1" ${@:2}
  else
    git commit -m $*
  fi
}

mku() {
  eval $(minikube docker-env)
}

mkd() {
  eval $(minikube docker-env -u)
}

# chpwd functions

__cd_nvm() {
  local file="$PWD/.nvmrc"

  [ -f $file ] && nvm use $(cat $file) &>/dev/null
}

__cd_nvm

__cd_chruby() {
  local file="$PWD/.ruby-version"

  [ -f $file ] && chruby $(cat $file) &>/dev/null
}

__cd_chruby

chpwd_functions=("__cd_nvm" "__cd_chruby")
