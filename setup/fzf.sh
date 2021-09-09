#!/bin/bash

set -x

case "$1" in
  install_macos)
    brew install fzf --HEAD

    "$(brew --prefix)/opt/fzf/install"
  ;;

  install_ubuntu)
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"

    "$HOME/.fzf/install" --key-bindings --completion --no-update-rc

    echo "source $HOME/.fzf.zsh" >> "$HOME/.zsh_custom"
  ;;
esac
