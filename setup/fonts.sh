#!/bin/bash

brew cask install font-fira-code

if [[ "$OSTYPE" == "darwin"* ]]; then
  nf_tmp="/tmp/nerd-fonts"

  git clone git@github.com:ryanoasis/nerd-fonts.git $nf_tmp

  pushd $nf_tmp || exit
    find /Users/james/Library/Fonts -name 'Fira*.ttf' | awk '{print $1}' | xargs -n 1 ./font-patcher
    mv ./*.ttf "$HOME/Desktop"
  popd || exit

  rm -r $nf_tmp

  open "$HOME"/Desktop/*.ttf

  rd_tmp="/tmp/ranger_devicons"

  git clone https://github.com/alexanderjeurissen/ranger_devicons $rd_tmp

  pushd $rd_tmp || exit
    make install
  popd || exit

  rm -r $rd_tmp
fi
