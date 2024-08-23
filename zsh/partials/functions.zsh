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

gsv() {
    vim $(git status -s | awk '{print $NF}' | fzf --height=25)
}

gpo() {
    git push -u origin "$(__git_branch)"
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
__set_versions() {
    if __file_exists 'package.json' || __file_exists '.nvmrc'; then
        local node_version=$(node -v)
    fi

    if __file_exists 'Gemfile' || __file_exists '.ruby-version'; then
        local ruby_version=$(ruby --version | awk '{print $2}')
    fi

    if [[ -n $VIRTUAL_ENV ]] || __file_exists 'requirements.txt'; then
        local python_version=$(python --version | awk '{print $2}')
    fi

    if __file_exists 'go.mod'; then
        local go_version=$(go version | awk '{print $3}')
    fi

    if __file_exists 'Setup.hs'; then
        local haskell_version=$(ghc --version | awk '{print $NF}')
    fi

    if __file_exists 'Cargo.toml'; then
        local rust_version=$(rustc --version | awk '{print $2}')
    fi

    export PROMPT_GO_VERSION=$go_version
    export PROMPT_HASKELL_VERSION=$haskell_version
    export PROMPT_NODE_VERSION=$node_version
    export PROMPT_PYTHON_VERSION=$python_version
    export PROMPT_RUBY_VERSION=$ruby_version
    export PROMPT_RUST_VERSION=$rust_version
}

chpwd_functions+=(__set_versions)
