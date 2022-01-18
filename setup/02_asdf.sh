#!/bin/bash

case "$1" in
  install_macos)
    brew install asdf

    ASDF_BREW_PATH=$(brew --prefix asdf 2>/dev/null)

    if [ -f $ASDF_BREW_PATH/asdf.sh ]; then
      echo "source $ASDF_BREW_PATH/asdf.sh" >> "$HOME/.zsh_custom"
    fi
  ;;

  install_ubuntu)
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

    echo "source $HOME/.asdf/asdf.sh" >> "$HOME/.zsh_custom"
  ;;
esac

setup() {
  asdf plugin-add elixir
  asdf plugin-add erlang
  asdf plugin-add nodejs
  asdf plugin-add ruby

  ln -s "$DOTFILES/asdf/.default-gems" "$HOME/.default-gems"
  ln -s "$DOTFILES/asdf/.default-npm-packages" "$HOME/.default-npm-packages"
  ln -s "$DOTFILES/asdf/.asdfrc" "$HOME/.asdfrc"
}
