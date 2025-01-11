#!/bin/bash

DOTFILES_CONFIGS="${DOTFILES:-$HOME/dotfiles}/.config"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

case "$1" in
  link)
      ln -s "$DOTFILES_CONFIGS/$2" "$XDG_CONFIG_HOME"
    ;;
  *)
    for dir in "$DOTFILES_CONFIGS"/*; do
      ln -s "$dir" "$XDG_CONFIG_HOME"
    done
esac
