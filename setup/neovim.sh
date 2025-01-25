#!/bin/bash

set -x

install_standard() {
    setup/dotconfig.sh link nvim
    rustup toolchain install nightly
}

install_macos() {
    brew install --head neovim

    install_standard
}

install_ubuntu() {
    if [[ -z $SPIN ]]; then
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install -y neovim
    fi

    install_standard
}

update() {
    brew reinstall neovim --fetch-head
}

case "$1" in
    install_macos)
        install_macos
        ;;

    install_ubuntu)
        install_ubuntu
        ;;

    update)
        update
        ;;

    *)
        echo "install_macos | install_ubuntu | update"
esac
