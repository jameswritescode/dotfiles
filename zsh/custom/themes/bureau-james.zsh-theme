# oh-my-zsh Bureau Theme

### Git ‹±master ▾●›

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}›"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status () {
  _STATUS=""

  # check status of files
  _INDEX=$(command git status --porcelain 2> /dev/null)
  if [[ -n "$_INDEX" ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi
    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    if $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    # _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
    _STATUS="$_STATUS"
  fi

  # check status of local repository
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi

  if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
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

_node_theme_prompt () {
  [[ -n "$PROMPT_NODE_VERSION" ]] &&
    echo "‹%{$fg_bold[green]%}node-$PROMPT_NODE_VERSION%{$reset_color%}› "
}

_ruby_theme_prompt () {
  [[ -n "$PROMPT_RUBY_VERSION" ]] &&
    echo "‹%{$fg_bold[red]%}ruby-$PROMPT_RUBY_VERSION%{$reset_color%}› "
}

_python_theme_prompt () {
  [[ -n "$PROMPT_PYTHON_VERSION" ]] &&
    echo "‹%{$fg_bold[yellow]%}python-$PROMPT_PYTHON_VERSION%{$reset_color%}› "
}

_go_theme_prompt() {
  [[ -n "$PROMPT_GO_VERSION" ]] &&
    echo "‹%{$fg_bold[green]%}$PROMPT_GO_VERSION%{$reset_color%}› "
}

_jobs_theme_prompt () {
  local running_jobs="$(jobs -l | wc -l | sed 's/ //g')"

  if [[ $running_jobs -gt 0 ]]; then
    echo "‹%{$fg_bold[blue]%}jobs:$running_jobs%{$reset_color%}› "
  fi
}

_PATH="%{$fg_bold[white]%}%2c%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
elif ! [ -z ${VIM+x} ]; then
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}vim"
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
        _1RIGHT="$(_jobs_theme_prompt)$(_go_theme_prompt)$(_python_theme_prompt)$(_node_theme_prompt)$(_ruby_theme_prompt)‹%{$fg_bold[white]%}%*%{$reset_color%}›┐ "
        _1SPACES=$(get_space $_1LEFT $_1RIGHT)
        print
        print -rP "$_1LEFT$_1SPACES$_1RIGHT"
}

setopt prompt_subst
PROMPT='└‹$_LIBERTY› '
RPROMPT='‹$(bureau_git_prompt)┘'

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
