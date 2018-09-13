#!/bin/bash

brew install asdf

asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add nodejs
asdf plugin-add ruby

ln -s "$DOTFILES/asdf/.default-gems" "$HOME/.default-gems"
ln -s "$DOTFILES/asdf/.default-npm-packages" "$HOME/.default-npm-packages"
ln -s "$DOTFILES/asdf/.asdfrc" "$HOME/.asdfrc"
