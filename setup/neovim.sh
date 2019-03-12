#!/bin/bash

PYTHON_SERVER="python-language-server[all]"
VIMPATH="$DOTFILES/vim"

install() {
  # Neovim Setup
  brew tap neovim/neovim
  brew install neovim
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
  sh /tmp/installer.sh "$VIMPATH/bundle"

  ln -s "$VIMPATH" "$HOME/.config/nvim"

  install_python

  gem install neovim
  npm install -g neovim
}

# Neovim Python Host Setup
install_python() {
  pip3 install virtualenv

  virtualenv -p python2 "$VIMPATH/virtual/python2"
  "$VIMPATH"/virtual/python2/bin/pip install neovim

  virtualenv -p python3 "$VIMPATH/virtual/python3"
  "$VIMPATH"/virtual/python3/bin/pip install neovim

  pip3 install "$PYTHON_SERVER"
}

update_python() {
  for dir in "$VIMPATH"/virtual/python*/; do
    pushd "$dir" || exit
      "$VIMPATH"/virtual/python2/bin/pip install --upgrade neovim
      "$VIMPATH"/virtual/python3/bin/pip install --upgrade neovim
    popd || exit
  done

  pip3 install --upgrade "$PYTHON_SERVER"
}

update() {
  update_python

  gem update neovim
  npm install -g neovim
}

case "$1" in
  install)
    install
  ;;

  install_python)
    install_python
  ;;

  update)
    update
  ;;

  update_python)
    update_python
  ;;

  *)
    install
esac
