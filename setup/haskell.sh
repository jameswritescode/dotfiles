#!/bin/bash

brew install ghc haskell-stack
ln -s "$DOTFILES/.ghci" "$HOME/.ghci"

stack install hlint
