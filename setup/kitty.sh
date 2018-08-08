#!/bin/bash

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
mkdir -p "$HOME/.config"
ln -s "$DOTFILES/kitty.conf" "$HOME/.config/kitty.conf"
