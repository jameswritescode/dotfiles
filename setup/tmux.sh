#!/bin/bash

brew tmux reattach-to-user-namespace
ln -s "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
