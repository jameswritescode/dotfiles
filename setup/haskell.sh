#!/bin/bash

brew install ghc haskell-stack
ln -s "$DOTFILES/.ghci" "$HOME/.ghci"

clone https://github.com/haskell/haskell-ide-engine --recursive
cd haskell-ide-engine
stack install cabal-install
stack install hlint
make build-all
