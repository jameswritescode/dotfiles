#!/bin/bash

latest_version() {
  asdf list-all "$1" | grep -E '^(\d+\.?){3}$' | tail -n 1
}

install_version() {
  asdf install "$1" "$2"
  asdf global "$1" "$2"
}

install_version erlang "$(latest_version erlang)"
install_version elixir "$(latest_version elixir)"

mix local.hex --force
mix local.rebar --force

ELS_PATH="$DOTFILES/vim/langserver/elixir-ls"

git clone git@github.com:JakeBecker/elixir-ls.git "$ELS_PATH"

pushd "$ELS_PATH" || exit
  mix deps.get
  mix compile
  mix elixir_ls.release -o "$ELS_PATH/release"
popd || exit
