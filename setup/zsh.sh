#!/bin/bash

brew install zsh antigen
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm "$HOME/.zshrc"
ln -s "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
touch "$HOME/.zsh_custom"
