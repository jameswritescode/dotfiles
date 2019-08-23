#!/bin/bash

# shellcheck source=/dev/null
source "${BASH_SOURCE%/*}/helpers/asdf.sh"

ln -s "$DOTFILES/.gemrc" "$HOME/.gemrc"

asdf_install ruby

gem ctags

if  [[ "$OSTYPE" == "darwin"* ]]; then
  BUNDLE_JOBS=$(($(sysctl -n hw.ncpu) - 1))
else
  BUNDLE_JOBS=$(($(nproc) - 1))
fi

bundle config --global jobs $BUNDLE_JOBS

CONFIG_PATH="$HOME/.config/solargraph"
mkdir -p "$CONFIG_PATH"
ln -s "$DOTFILES/.solargraph.yml" "$CONFIG_PATH/config.yml"
