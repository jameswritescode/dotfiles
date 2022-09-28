#!/bin/bash

set -x

VIMPATH="$HOME/dotfiles/vim"

install_standard() {
  ln -s "$VIMPATH" "$HOME/.config/nvim"

  pip3 install --upgrade pynvim
  gem install neovim
  yarn global add neovim
}

install_macos() {
  # Neovim Setup
  brew tap neovim/neovim
  brew install neovim --HEAD --build-from-source

  install_standard
  install_packer
}

install_ubuntu() {
  if [[ -z $SPIN ]]; then
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install -y neovim
  fi

  install_standard
  install_packer

  if [[ -z $SPIN ]]; then
    nvim +PlugInstall +qall >/dev/null
  fi
}

install_packer() {
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
}

update_python() {
  pip3 install --upgrade pynvim
}

update() {
  # Client
  brew reinstall neovim --build-from-source

  # Dependencies
  update_python
  gem update neovim
  yarn global add neovim
  [[ -z $SPIN ]] && nvim +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qall >/dev/null
}

case "$1" in
  install_macos)
    install_macos
  ;;

  install_ubuntu)
    install_ubuntu
  ;;

  install_packer)
    install_packer
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
