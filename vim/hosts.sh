#!/bin/bash

case "$1" in
  install)
    gem install neovim
    npm install -g neovim
    pip3 install virtualenv
    virtualenv -p python2 $DOTFILES/vim/virtual/python2
    $DOTFILES/vim/virtual/python2/bin/pip install neovim
    virtualenv -p python3 $DOTFILES/vim/virtual/python3
    $DOTFILES/vim/virtual/python3/bin/pip install neovim
    ;;
  update)
    for dir in $DOTFILES/vim/virtual/python*/; do
      pushd $dir
        source bin/activate
        pip install --upgrade neovim
        deactivate
      popd
    done

    gem update neovim
    npm install -g neovim
    ;;
esac
