#!/bin/bash

VIMPATH="$DOTFILES/vim"

install() {
  # Neovim Setup
  brew tap neovim/neovim
  brew install neovim --HEAD
  install_nightly

  ln -s "$VIMPATH" "$HOME/.config/nvim"

  install_python

  gem install neovim
  yarn global add neovim
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
  brew reinstall neovim

  # Dependencies
  update_python
  gem update neovim
  yarn global add neovim
  nvim +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qall >/dev/null
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
