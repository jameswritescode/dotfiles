#!/bin/bash

ln -s "$DOTFILES/.gemrc" "$HOME/.gemrc"

LATEST_STABLE_RUBY=$(asdf list-all ruby | grep -E '^(\d+\.?){3}$' | tail -n 1)
asdf install ruby "$LATEST_STABLE_RUBY"
asdf global ruby "$LATEST_STABLE_RUBY"

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
