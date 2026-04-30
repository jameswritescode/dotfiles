#!/bin/bash

install_macos() {
    brew install --cask cmux
    defaults write com.cmuxterm.app ApplePressAndHoldEnabled -bool false
    setup/dotconfig.sh link cmux
}

case "$1" in
    install_macos)
        install_macos
        ;;

    *)
        echo "install_macos"
esac
