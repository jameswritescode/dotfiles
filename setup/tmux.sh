#!/bin/bash

install_standard() {
    setup/dotconfig.sh tmux
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
}

install_macos() {
    install_standard
    brew install tmux overmind jq
}

install_ubuntu() {
    install_standard
    sudo apt install tmux
}

case "$1" in
    install_ubuntu)
        install_ubuntu
        ;;

    install_macos)
        install_macos
        ;;
esac
