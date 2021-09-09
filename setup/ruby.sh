#!/bin/bash

source "$HOME/dotfiles/setup/helpers/asdf.sh"

ln -s "$HOME/dotfiles/.gemrc" "$HOME/.gemrc"

asdf_install ruby

gem ctags

if  [[ "$OSTYPE" == "darwin"* ]]; then
  BUNDLE_JOBS=$(($(sysctl -n hw.ncpu) - 1))
else
  BUNDLE_JOBS=$(($(nproc) - 1))
fi

bundle config --global jobs $BUNDLE_JOBS
