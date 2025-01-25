#!/bin/bash

set -xeuo pipefail

ZSHRC_PATH="$HOME/dotfiles/zsh/.zshrc"
DEST_PATH="$HOME/.zshrc"
CUSTOM_FILE="$HOME/.zsh_custom"

touch "$CUSTOM_FILE"
touch "$HOME/.df-omz-migration"

case "$1" in
    install_macos)
        if [[ "$SHELL" != */zsh ]]; then
            brew install zsh
            chsh -s /bin/zsh
        fi

        if [ -f "$HOME/.zshrc" ]; then
            echo "There is already a .zshrc, sourcing from dotfiles."
            echo "source $ZSHRC_PATH" >> "$DEST_PATH"
        else
            ln -s "$ZSHRC_PATH" "$DEST_PATH"
        fi
        ;;

    install_ubuntu)
        if [[ -z $SPIN ]]; then
            sudo apt-get install -y zsh
            sudo chsh -s zsh
        else
            {
                echo "source $HOME/dotfiles/zsh/partials/aliases.zsh"
                echo "source $HOME/dotfiles/zsh/partials/functions.zsh"
                echo "source $HOME/dotfiles/zsh/partials/exports.zsh"
            } >> "$CUSTOM_FILE"

            echo "source $CUSTOM_FILE" >> "$DEST_PATH"
        fi
        ;;
esac
