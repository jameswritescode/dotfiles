#!/bin/bash

set -xeuo pipefail

ZSHRC_PATH="$HOME/dotfiles/zsh/.zshrc"
DEST_PATH="$HOME/.zshrc"
CUSTOM_FILE="$HOME/.zsh_custom"

touch "$CUSTOM_FILE"
touch "$HOME/.df-omz-migration"

install_standard() {
    if [ -f "$HOME/.zshrc" ]; then
        echo "There is already a .zshrc, sourcing from dotfiles."
        echo "source $ZSHRC_PATH" >> "$DEST_PATH"
    else
        ln -s "$ZSHRC_PATH" "$DEST_PATH"
    fi
}

case "$1" in
    install_macos)
        if [[ "$SHELL" != */zsh ]]; then
            brew install zsh
            chsh -s /bin/zsh
        fi

        install_standard
        ;;

    install_ubuntu)
        sudo apt-get install -y zsh
        sudo chsh -s zsh
        install_standard
        ;;
esac
