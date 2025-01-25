#!/bin/bash

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

ln -s "$DOTFILES/ctags" "$HOME/.ctags.d"
