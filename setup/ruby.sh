#!/bin/bash

brew install chruby ruby-install --HEAD
ruby-install --latest ruby
chruby ruby
ruby -v | awk '{print "! [ -f \"$PWD/.ruby-version\" ] && chruby " $2}' >> "$HOME/.zsh_custom"
ln -s "$DOTFILES/.gemrc" "$HOME/.gemrc"
gem install gem-ctags
gem ctags
gem install bundler tmuxinator rubocop reek

if  [[ "$OSTYPE" == "darwin"* ]]; then
  BUNDLE_JOBS=$(($(sysctl -n hw.ncpu) - 1))
else
  BUNDLE_JOBS=$(($(nproc) - 1))
fi

bundle config --global jobs $BUNDLE_JOBS
