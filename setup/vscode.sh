#!/bin/bash

brew cask install visual-studio-code

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

ln -s "$DOTFILES/vscode.json" "$HOME/Library/Application Support/Code/User/settings.json"

code () {
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" "$@"
}

code --install-extension castwide.solargraph
code --install-extension dbaeumer.vscode-eslint
code --install-extension flowtype.flow-for-vscode
code --install-extension rebornix.ruby
code --install-extension vscodevim.vim
