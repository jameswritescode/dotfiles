#!/bin/bash

brew install ghc haskell-stack
ln -s "$DOTFILES/.ghci" "$HOME/.ghci"

stack install hlint

HIE_PATH="/tmp/haskell-ide-engine"

git clone git@github.com:haskell/haskell-ide-engine.git $HIE_PATH

pushd $HIE_PATH || exit
  GHC_VERSION=$(ghc -V | grep -Eo '(?:\d\.?){3}')

  stack ./install.hs "cabal-hie-$GHC_VERSION"
  stack ./install.hs "cabal-build-doc-$GHC_VERSION"
popd || exit
