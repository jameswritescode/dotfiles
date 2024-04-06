#!/bin/bash

# curl -s https://api.github.com/repos/dandavison/delta/releases/latest \
#   | grep "browser_download_url.*amd64.deb" \
#   | cut -d : -f2,3 \
#   | head -n1 \
#   | tr -d '"' \
#   | wget -O git-delta.deb -i -

# sudo dpkg -i git-delta.deb
# rm git-delta.deb

# git
./setup/git.sh install_ubuntu
git config --global --unset core.pager

# zsh
./setup/zsh.sh install_ubuntu

# neovim
./setup/neovim.sh install_ubuntu

# tmux
./setup/tmux.sh install_ubuntu
