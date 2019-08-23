#!/bin/bash

asdf_install() {
  version=$(asdf list-all "$1" | grep -E '^(\d+\.?){3}$' | tail -n 1)

  asdf install "$1" "$version"
  asdf global "$1" "$version"
}
