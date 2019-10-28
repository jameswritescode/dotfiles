#!/bin/bash

VIMPATH="$DOTFILES/vim"

install() {
  # Neovim Setup
  brew tap neovim/neovim
  install_nightly

  ln -s "$VIMPATH" "$HOME/.config/nvim"

  install_python

  gem install neovim
  npm install -g neovim
}

install_nightly() {
  brew install neovim --HEAD
}

install_plug() {
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Neovim Python Host Setup
install_python() {
  virtualenv -p python3 "$VIMPATH/virtual/python3"
  "$VIMPATH"/virtual/python3/bin/pip install pynvim
}

update_python() {
  "$VIMPATH"/virtual/python3/bin/pip install --upgrade pynvim
}

update() {
  # Client
  install_nightly

  # Dependencies
  update_python
  gem update neovim
  npm install -g neovim
  nvim +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qall >/dev/null
}

case "$1" in
  install)
    install
  ;;

  install_nightly)
    install_nightly
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
