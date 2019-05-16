#!/bin/bash

VIMPATH="$DOTFILES/vim"

install() {
  # Neovim Setup
  brew tap neovim/neovim
  brew install neovim

  ln -s "$VIMPATH" "$HOME/.config/nvim"

  install_dein
  install_python

  gem install neovim
  npm install -g neovim
}

install_plug() {
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Neovim Python Host Setup
install_python() {
  virtualenv -p python2 "$VIMPATH/virtual/python2"
  "$VIMPATH"/virtual/python2/bin/pip install pynvim

  virtualenv -p python3 "$VIMPATH/virtual/python3"
  "$VIMPATH"/virtual/python3/bin/pip install pynvim
}

update_python() {
  for dir in "$VIMPATH"/virtual/python*/; do
    pushd "$dir" || exit
      "$VIMPATH"/virtual/python2/bin/pip install --upgrade pynvim
      "$VIMPATH"/virtual/python3/bin/pip install --upgrade pynvim
    popd || exit
  done
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

  install_plug)
    install_plug
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
