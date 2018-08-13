#!/bin/bash

brew cask install font-fira-code

if [[ "$OSTYPE" == "darwin"* ]]; then
  git clone git@github.com:ryanoasis/nerd-fonts.git /tmp/nerd-fonts

  pushd /tmp/nerd-fonts || exit
    find /Users/james/Library/Fonts -name 'Fira*.ttf' | awk '{print $1}' | xargs -n 1 ./font-patcher
    mv ./*.ttf "$HOME/Desktop"
    rm -r nerd-fonts
  popd || exit

  open "$HOME"/Desktop/*.ttf
fi
