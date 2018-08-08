#!/bin/bash

brew tap neovim/neovim
brew install neovim
mkdir -p "$HOME/dotfiles/vim/bundle/repos/github.com/Shougo/dein.vim"
git clone https://github.com/Shougo/dein.vim vim/bundle/repos/github.com/Shougo/dein.vim
ln -s "$DOTFILES/vim" "$HOME/.config/nvim"
./vim/hosts.sh install
