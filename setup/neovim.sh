#!/bin/bash

install() {
  # neovim
  brew tap neovim/neovim
  brew install neovim
  mkdir -p "$HOME/dotfiles/vim/bundle/repos/github.com/Shougo/dein.vim"
  git clone https://github.com/Shougo/dein.vim vim/bundle/repos/github.com/Shougo/dein.vim
  ln -s "$DOTFILES/vim" "$HOME/.config/nvim"

  # hosts
  gem install neovim
  npm install -g neovim
  pip3 install virtualenv
  virtualenv -p python2 "$DOTFILES/vim/virtual/python2"
  "$DOTFILES"/vim/virtual/python2/bin/pip install neovim
  virtualenv -p python3 "$DOTFILES/vim/virtual/python3"
  "$DOTFILES"/vim/virtual/python3/bin/pip install neovim
}

update() {
  for dir in "$DOTFILES"/vim/virtual/python*/; do
    pushd "$dir" || exit
      source bin/activate
      pip install --upgrade neovim
      deactivate
    popd || exit
  done

  gem update neovim
  npm install -g neovim
}

case "$1" in
  install)
    install
  ;;

  update)
    update
  ;;

  *)
    install
esac
