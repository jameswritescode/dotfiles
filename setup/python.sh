#!/bin/bash

set -x

case "$1" in
  install_macos)
    mise use --global python

    pip install virtualenv
  ;;

  install_ubuntu)
    sudo apt-get install -y python3-dev python3-pip
  ;;
esac
