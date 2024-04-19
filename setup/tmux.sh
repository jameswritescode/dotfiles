#!/bin/bash

install_macos() {
  brew install tmux overmind
  ln -s "$DOTFILES/.config/tmux" "$HOME/.config/tmux"
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

install_ubuntu() {
  ln -s "$HOME/dotfiles/.config/tmux" "$HOME/.config/tmux"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
}

case "$1" in
  install_ubuntu)
    install_ubuntu
  ;;

  install_macos)
    install_macos
  ;;
esac
