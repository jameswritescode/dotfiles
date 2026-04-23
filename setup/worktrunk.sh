#!/bin/bash

install_shell_integration() {
    echo 'if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi' >> "$HOME/.zsh_custom"
}

install_macos() {
    brew install worktrunk
    install_shell_integration
}

case "$1" in
    install_macos)
        install_macos
        ;;

    *)
        echo "install_macos"
esac
