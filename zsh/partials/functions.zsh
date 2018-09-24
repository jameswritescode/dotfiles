# functions

cat() {
  if [ $(command -v bat) ]; then
    bat $*
  else
    /bin/cat $*
  fi
}

dsa() {
  docker stop $(docker ps -a -q)
}

fk() {
  ps aux | grep $* | grep -v grep | awk '{print $2}' | xargs kill -9
}

gcm() {
  if [[ -z $1 ]]; then
    echo "Error: No commit message provided."
    return 1
  fi

  local ticket=$(git rev-parse --abbrev-ref HEAD | egrep -o "(ENG|MAINT)-\d+")

  if [[ -n "$ticket" ]]; then
    git commit -m "[$ticket] $1" ${@:2}
  else
    git commit -m $*
  fi
}

ls() {
  if [[ -n $(command -v exa) && ! $* =~ -A ]]; then
    exa -a $*
  else
    /bin/ls -G -a $*
  fi
}

mkd() {
  eval $(minikube docker-env -u)
}

mku() {
  eval $(minikube docker-env)
}

vc() {
  if [[ $(pbpaste | wc -l) -gt 1 ]]; then
    pbpaste | vim -
  else
    vim "$(pbpaste)"
  fi
}

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

# update title when changes are made

__set_title() {
  if [[ -z $1 ]]; then
    title "%2c"
  else
    setopt extended_glob

    title ${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  fi
}

precmd_functions+=(__set_title)
preexec_functions+=(__set_title)
