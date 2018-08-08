#!/bin/bash

brew cask install font-fira-code

if [[ "$OSTYPE" == "darwin"* ]]; then
  git clone git@github.com:ryanoasis/nerd-fonts.git

  pushd ./nerd-fonts || exit
    find /Users/james/Library/Fonts -name 'Fira*.ttf' | awk '{print $1}' | xargs -n 1 ./font-patcher
    open ./*.ttf
  popd || exit

  rm -r nerd-fonts
fi
