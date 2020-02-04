#!/bin/bash

brew cask install font-fira-code font-jetbrains-mono

if [[ "$OSTYPE" == "darwin"* ]]; then
  nf_tmp="/tmp/nerd-fonts"

  git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git $nf_tmp

  pushd $nf_tmp || exit
    find /Users/james/Library/Fonts -name 'Fira*.ttf' |
      awk '{print $1}' |
      xargs -n 1 ./font-patcher -c

    mv ./*.ttf "$HOME/Desktop"
  popd || exit

  rm -r $nf_tmp

  open "$HOME"/Desktop/*.ttf
fi
