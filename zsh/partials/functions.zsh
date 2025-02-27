# helper functions

__file_exists() {
    [ -f "$PWD/$1" ] && return
    false
}

__git_branch() {
    git rev-parse --abbrev-ref HEAD
}

__ticket_number() {
    __git_branch | grep -E -o '^[A-Z]+-\d+'
}

# functions

cat() {
    if [ $(command -v bat) ]; then
        bat --theme TwoDark $*
    else
        /bin/cat $*
    fi
}

dsa() {
    docker stop $(docker ps -a -q)
}

dra() {
    docker rm $(docker ps -a -q)
}

fk() {
    ps aux | grep $* | grep -v grep | awk '{print $2}' | xargs kill -9
}

gcm() {
    if [[ -z $1 ]]; then
        echo "Error: No commit message provided."
        return 1
    fi

    local ticket=$(__ticket_number)

    if [[ -n "$ticket" ]]; then
        git commit -m "[$ticket] $1" ${@:2}
    else
        git commit -m $*
    fi
}

gro() {
    git fetch origin "$1"
    git rebase "origin/$1"
}

jv() {
    if [ $# -eq 0 ]; then
        jira view $(__ticket_number)
    else
        jira view $*
    fi
}

ls() {
    if [[ -n $(command -v eza) && ! $* =~ -A ]]; then
        eza -a $*
    else
        /bin/ls -G -a $*
    fi
}

v() {
    local files
    files=("${(f)$(fzf --height=25 -m --bind ctrl-a:select-all,ctrl-d:deselect-all)}")

    if [ "${#files}" -gt 1 ]; then
        local tmpname
        tmpname="$(mktemp)"

        echo "${(F)files}" | sed 's/\(.*\)/\1:1:1/' > "$tmpname"

        vim -q "$tmpname" +copen
    else
        vim "${files[@]}"
    fi
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

if [[ -n $ZSH ]]; then
    # update title when changes are made
    if [ $(command -v title) ]; then
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
    fi
fi

# Set language versions as ENV variables on chpwd
__chpwd_set_prompt_variables() {
    local node_version ruby_version python_version go_version haskell_version rust_version

    if __file_exists 'package.json' || __file_exists '.nvmrc'; then
        node_version="$(node -v)"
    fi

    if __file_exists 'Gemfile' || __file_exists '.ruby-version'; then
        ruby_version="$(ruby --version | awk '{print $2}')"
    fi

    if [[ -n $VIRTUAL_ENV ]] || __file_exists 'requirements.txt'; then
        python_version="$(python --version | awk '{print $2}')"
    fi

    if __file_exists 'go.mod'; then
        go_version="$(go version | awk '{print $3}')"
    fi

    if __file_exists 'Setup.hs'; then
        haskell_version="$(ghc --version | awk '{print $NF}')"
    fi

    if __file_exists 'Cargo.toml'; then
        rust_version="$(rustc --version | awk '{print $2}')"
    fi

    export PROMPT_GO_VERSION="$go_version"
    export PROMPT_HASKELL_VERSION="$haskell_version"
    export PROMPT_NODE_VERSION="$node_version"
    export PROMPT_PYTHON_VERSION="$python_version"
    export PROMPT_RUBY_VERSION="$ruby_version"
    export PROMPT_RUST_VERSION="$rust_version"
}

chpwd_functions+=(__chpwd_set_prompt_variables)

__precmd_set_prompt_variables() {
    local k8s_context

    if [[ -n "$KUBECONFIG" ]]; then
        k8s_context="$(kubectl config current-context)"
    fi

    export PROMPT_K8S_CONTEXT="$k8s_context"
}

add-zsh-hook precmd __precmd_set_prompt_variables
