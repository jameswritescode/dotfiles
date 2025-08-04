#!/bin/bash

set -x

install_shell_integration() {
    echo "source <(fzf --zsh)" >> "$HOME/.zsh_custom"
}

case "$1" in
    install_macos)
        brew install fd
        brew install fzf --HEAD
        install_shell_integration
        ;;

    install_ubuntu)
        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"

        "$HOME/.fzf/install" --key-bindings --completion --no-update-rc

        echo 'export PATH="$HOME/.fzf/bin:$PATH' >> "$HOME/.zsh_custom"
        install_shell_integration
        ;;

    *)
        echo "install_macos | install_ubuntu"
esac
