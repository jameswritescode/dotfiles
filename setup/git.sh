#!/bin/bash

brew install git git-extras diff-so-fancy git-delta
ln -s "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
