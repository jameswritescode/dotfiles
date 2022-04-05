#!/bin/bash

./setup/git.sh install_ubuntu
./setup/zsh.sh install_ubuntu

sudo gem install neovim
./setup/neovim.sh install_ubuntu
