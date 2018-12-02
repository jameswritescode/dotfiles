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
