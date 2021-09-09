#!/bin/bash

set -x

case "$1" in
  install_macos)
    brew install python

    pip3 install virtualenv "python-language-server[all]"

    echo "export PATH=\"/usr/local/opt/python/libexec/bin:\$PATH\"" >> "$HOME/.zsh_custom"
  ;;

  install_ubuntu)
    sudo apt-get install -y python3-dev python3-pip
  ;;
esac
