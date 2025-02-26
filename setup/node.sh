#!/bin/bash

set -x

case "$1" in
  install_macos)
    mise use --global node
  ;;

  install_ubuntu)
    curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
    sudo apt-get install -y nodejs
    npm install -g neovim
  ;;
esac
