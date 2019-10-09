#!/bin/bash

VIMPATH="$DOTFILES/vim"
CLIENTPATH="$HOME/nvim-osx64"

install() {
  # Neovim Setup
  brew tap neovim/neovim
  brew install neovim

  ln -s "$VIMPATH" "$HOME/.config/nvim"

  install_python

  gem install neovim
  npm install -g neovim
}

install_nightly() {
  pushd /tmp || exit
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
    tar zxf nvim-macos.tar.gz
    rm -r nvim-macos.tar.gz
    rm -rf "$CLIENTPATH"
    mv  "nvim-osx64" "$CLIENTPATH"
  popd || exit
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
  "$CLIENTPATH"/bin/nvim +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qall >/dev/null
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
