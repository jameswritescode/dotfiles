#!/bin/bash

set -x

setup/dotconfig.sh link git

CUSTOMFILE="$HOME/.gitconfig_custom"

touch "$CUSTOMFILE"
touch "$HOME/.gitignore_global"

case "$1" in
    install_macos)
        brew install git git-extras delta
        ;;

    install_ubuntu)
        sudo add-apt-repository -y ppa:git-core/ppa
        sudo apt-get install -y git
        ;;
esac
