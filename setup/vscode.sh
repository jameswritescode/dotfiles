#!/bin/bash

brew cask install visual-studio-code

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

ln -s "$DOTFILES/vscode.json" "$HOME/Library/Application Support/Code/User/settings.json"
