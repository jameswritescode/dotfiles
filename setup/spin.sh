#!/bin/bash

curl -s https://api.github.com/repos/dandavison/delta/releases/latest \
  | grep "browser_download_url.*amd64.deb" \
  | cut -d : -f2,3 \
  | head -n1 \
  | tr -d '"' \
  | wget -O git-delta.deb -i -

sudo dpkg -i git-delta.deb
rm git-delta.deb

./setup/git.sh install_ubuntu
./setup/zsh.sh install_ubuntu

sudo gem install neovim --no-doc
./setup/neovim.sh install_ubuntu
