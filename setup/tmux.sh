#!/bin/bash

install_macos() {
  brew install tmux overmind
  ln -s "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_ubuntu() {
  ln -s "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
}

case "$1" in
  install_ubuntu)
    install_ubuntu
  ;;

  install_macos)
    install_macos
  ;;
esac
