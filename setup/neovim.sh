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

install_dein() {
  TMP_LOC=/tmp/installer.sh

  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $TMP_LOC
  sh $TMP_LOC "$VIMPATH/bundle"
  rm $TMP_LOC
}

# Neovim Python Host Setup
install_python() {
  virtualenv -p python2 "$VIMPATH/virtual/python2"
  "$VIMPATH"/virtual/python2/bin/pip install neovim

  virtualenv -p python3 "$VIMPATH/virtual/python3"
  "$VIMPATH"/virtual/python3/bin/pip install neovim
}

update_python() {
  for dir in "$VIMPATH"/virtual/python*/; do
    pushd "$dir" || exit
      "$VIMPATH"/virtual/python2/bin/pip install --upgrade neovim
      "$VIMPATH"/virtual/python3/bin/pip install --upgrade neovim
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

  install_dein)
    install_dein
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
