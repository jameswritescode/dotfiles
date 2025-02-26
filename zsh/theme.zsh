# oh-my-zsh Bureau Theme (customized by james newton)

### Git ‹±master ▾●›

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}›"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

bureau_git_command() {
    GIT_OPTIONAL_LOCKS=0 command git "$@"
}

bureau_git_branch() {
    local ref

    ref=$(bureau_git_command symbolic-ref HEAD 2> /dev/null) || \
        ref=$(bureau_git_command rev-parse --short HEAD 2> /dev/null) || return

    echo "${ref#refs/heads/}"
}

bureau_git_status() {
    if [[ "$(bureau_git_command config --get zsh.hide-status 2>/dev/null)" -eq 1 ]]; then
        echo ""
        return
    fi

    local index git_status

    # check status of files
    index=$(bureau_git_command status --porcelain 2> /dev/null)

    if [[ -n "$index" ]]; then
        if $(echo "$index" | command grep -q '^[AMRD]. '); then
            git_status="$git_status$ZSH_THEME_GIT_PROMPT_STAGED"
        fi

        if $(echo "$index" | command grep -q '^.[MTD] '); then
            git_status="$git_status$ZSH_THEME_GIT_PROMPT_UNSTAGED"
        fi

        if $(echo "$index" | command grep -q -E '^\?\? '); then
            git_status="$git_status$ZSH_THEME_GIT_PROMPT_UNTRACKED"
        fi

        if $(echo "$index" | command grep -q '^UU '); then
            git_status="$git_status$ZSH_THEME_GIT_PROMPT_UNMERGED"
        fi
    else
        # git_status="$git_status$ZSH_THEME_GIT_PROMPT_CLEAN"
        git_status="$git_status"
    fi

    # check status of local repository
    index=$(bureau_git_command status --porcelain -b 2> /dev/null)

    if $(echo "$index" | command grep -q '^## .*ahead'); then
        git_status="$git_status$ZSH_THEME_GIT_PROMPT_AHEAD"
    fi

    if $(echo "$index" | command grep -q '^## .*behind'); then
        git_status="$git_status$ZSH_THEME_GIT_PROMPT_BEHIND"
    fi

    if $(echo "$index" | command grep -q '^## .*diverged'); then
        git_status="$git_status$ZSH_THEME_GIT_PROMPT_DIVERGED"
    fi

    if $(command git rev-parse --verify refs/stash &> /dev/null); then
        git_status="$git_status$ZSH_THEME_GIT_PROMPT_STASHED"
    fi

    echo "$git_status"
}

bureau_git_prompt() {
    local branch git_status result

    branch="$(bureau_git_branch)"
    git_status="$(bureau_git_status)"

    if [[ "${branch}x" != "x" ]]; then
        result="$ZSH_THEME_GIT_PROMPT_PREFIX$branch"

        if [[ "${git_status}x" != "x" ]]; then
            result="$result $git_status"
        fi

        result="$result$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi

    echo "$result"
}

_node_theme_prompt() {
    [[ -n "$PROMPT_NODE_VERSION" ]] &&
    echo "‹%{$fg_bold[green]%}node:$PROMPT_NODE_VERSION%{$reset_color%}› "
}

_ruby_theme_prompt() {
    [[ -n "$PROMPT_RUBY_VERSION" ]] &&
    echo "‹%{$fg_bold[red]%}ruby:$PROMPT_RUBY_VERSION%{$reset_color%}› "
}

_python_theme_prompt() {
    [[ -n "$PROMPT_PYTHON_VERSION" ]] &&
    echo "‹%{$fg_bold[yellow]%}python:$PROMPT_PYTHON_VERSION%{$reset_color%}› "
}

_go_theme_prompt() {
    [[ -n "$PROMPT_GO_VERSION" ]] &&
    echo "‹%{$fg_bold[green]%}$PROMPT_GO_VERSION%{$reset_color%}› "
}

_haskell_theme_prompt() {
    [[ -n "$PROMPT_HASKELL_VERSION" ]] &&
    echo "‹%{$fg_bold[magenta]%}ghc:$PROMPT_HASKELL_VERSION%{$reset_color%}› "
}

_rust_theme_prompt() {
    [[ -n "$PROMPT_RUST_VERSION" ]] &&
    echo "‹%B%F{#dea584}rust:$PROMPT_RUST_VERSION%{$reset_color%}› "
}

_jobs_theme_prompt() {
    local running_jobs
    running_jobs="$(jobs -l | wc -l | sed 's/ //g')"

    if [[ $running_jobs -gt 0 ]]; then
        echo "‹%{$fg_bold[blue]%}jobs:$running_jobs%{$reset_color%}› "
    fi
}

_k8s_theme_prompt() {
    [[ -n "$PROMPT_K8S_CONTEXT" ]] &&
    echo "‹%B%F{#326ce5}k8s:$PROMPT_K8S_CONTEXT%{$reset_color%}› "
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


get_space() {
    local str zero length

    str="$1$2"
    zero='%([BSUbfksu]|([FB]|){*})'

    length="${#${(S%%)str//$~zero/}}"
    length="$((COLUMNS - length))"

    printf '%*s' "$length"
}

bureau_precmd() {
    local left right spaces

    left="┌‹$_USERNAME› ‹$_PATH›"

    local prompt_functions=(
        _jobs_theme_prompt
        _go_theme_prompt
        _python_theme_prompt
        _node_theme_prompt
        _ruby_theme_prompt
        _haskell_theme_prompt
        _rust_theme_prompt
        _k8s_theme_prompt
    )

    for func in "${prompt_functions[@]}"; do
        right+="$($func)"
    done

    right+="‹%{$fg_bold[white]%}%*%{$reset_color%}›┐ "

    spaces="$(get_space $left $right)"

    print
    print -rP "$left$spaces$right"
}

setopt prompt_subst
PROMPT='└‹$_LIBERTY› %F{green}'
RPROMPT='%f‹$(bureau_git_prompt)┘'

__color_escape() {
    echo -ne "\e[0m"
}

preexec_functions+=(__color_escape)

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
