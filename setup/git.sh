#!/bin/bash

brew install git git-extras diff-so-fancy
ln -s "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
