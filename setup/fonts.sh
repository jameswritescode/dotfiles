#!/bin/bash

brew cask reinstall font-fira-code font-jetbrains-mono

if [[ "$OSTYPE" == "darwin"* ]]; then
  nf_tmp="/tmp/nerd-fonts"

  git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git $nf_tmp

  pushd $nf_tmp || exit
    find -E /Users/james/Library/Fonts -regex '.*(Jet|Fira).*\.ttf' |
      xargs -n 1 ./font-patcher -c

    mv ./*.ttf "$HOME/Desktop"
  popd || exit

  rm -rf $nf_tmp

  open "$HOME"/Desktop/*.ttf
fi
