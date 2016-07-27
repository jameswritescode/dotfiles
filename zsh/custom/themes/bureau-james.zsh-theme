# oh-my-zsh Bureau Theme

### NVM

ZSH_THEME_NVM_PROMPT_PREFIX="%B⬡%b "
ZSH_THEME_NVM_PROMPT_SUFFIX=""

### Git ‹±master ▾●›

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}›"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

jobs_prompt () {
        local symbols= () {
                local RETVAL=$?
        }
        [[ $RETVAL -ne 0 ]] && symbols+="%{$fg[red]%}✘"
        [[ $UID -eq 0 ]] && symbols+="%{$fg[yellow]%}✔"
        [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{$fg[cyan]%}⚙"
        [[ -n "$symbols" ]] && echo -n "$symbols "
}

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status () {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  _STATUS=""
  if $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi
  if $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi
  if $(echo "$_INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if $(echo "$_INDEX" | grep '^UU ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | grep '^## .*diverged' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  echo $_STATUS
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _status=$(bureau_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}

_file_exists () {
  local check_dir="$PWD"
  while [ "$check_dir" != "/" ]
  do
          [ -f "$check_dir/$1" ] && return
          check_dir="$(dirname $check_dir)"
  done
  false
}

_node_theme_prompt () {
  if _file_exists 'package.json'
  then
          echo "‹%{$fg_bold[green]%}node-`node -v`%{$reset_color%}› "
  fi
}

_rvm_theme_prompt () {
  if _file_exists 'Gemfile'
  then
    echo "‹%{$fg_bold[red]%}`rvm-prompt`%{$reset_color%}› "
  fi
}

_python_theme_prompt () {
  if [[ -n $VIRTUAL_ENV ]]; then
    echo "‹%{$fg_bold[yellow]%}`python --version`%{$reset_color%}› "
  fi
}

_PATH="%{$fg_bold[white]%}%2c%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"


get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}

bureau_precmd () {
        _1LEFT="┌‹$_USERNAME› ‹$_PATH›"
        _1RIGHT="$(_python_theme_prompt)$(_node_theme_prompt)$(_rvm_theme_prompt)‹%{$fg_bold[white]%}%*%{$reset_color%}›┐ "
        _1SPACES=`get_space $_1LEFT $_1RIGHT`
        print
        print -rP "$_1LEFT$_1SPACES$_1RIGHT"
}

setopt prompt_subst
PROMPT='└‹$(jobs_prompt)$_LIBERTY› '
RPROMPT='‹$(bureau_git_prompt)┘'

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
