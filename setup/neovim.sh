#!/bin/bash

VIMPATH="$DOTFILES/vim"

LANGSERVERPATH="$VIMPATH/langserver"
HASKELL_SERVER="haskell-ide-engine"
PYTHON_SERVER="python-language-server[all]"

langserver_haskell_cmds() {
  pushd "$LANGSERVERPATH/haskell-ide-engine" || exit
    stack install cabal-install
    make build-all
  popd || exit
}

install() {
  # Neovim Setup
  brew tap neovim/neovim
  brew install neovim
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
  sh /tmp/installer.sh "$VIMPATH/bundle"

  ln -s "$VIMPATH" "$HOME/.config/nvim"

  # Neovim Python Host Setup
  pip3 install virtualenv

  virtualenv -p python2 "$VIMPATH/virtual/python2"
  "$VIMPATH"/virtual/python2/bin/pip install neovim

  virtualenv -p python3 "$VIMPATH/virtual/python3"
  "$VIMPATH"/virtual/python3/bin/pip install neovim

  # Language Servers
  mkdir -p "$LANGSERVERPATH"

  pip3 install "$PYTHON_SERVER"

  git clone "https://github.com/haskell/$HASKELL_SERVER" "$LANGSERVERPATH/$HASKELL_SERVER" --recursive
  langserver_haskell_cmds
}

update() {
  # Hosts
  for dir in "$VIMPATH"/virtual/python*/; do
    pushd "$dir" || exit
      # shellcheck disable=SC1091
      source bin/activate
      pip install --upgrade neovim
      deactivate
    popd || exit
  done

  gem update neovim
  npm install -g neovim

  # Language Servers
  pip3 install --upgrade "$PYTHON_SERVER"

  pushd "$LANGSERVERPATH/$HASKELL_SERVER" || exit
    git pull
    langserver_haskell_cmds
  popd || exit
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
