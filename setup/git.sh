#!/bin/bash

set -x

ln -sf "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"

CUSTOMFILE="$HOME/.gitconfig_custom"

touch "$CUSTOMFILE"

case "$1" in
  install_macos)
    brew install git git-extras diff-so-fancy git-delta
  ;;

  install_ubuntu)
    sudo add-apt-repository -y ppa:git-core/ppa
    sudo apt-get install -y git

    if [[ -n $SPIN ]]; then
      git config --file "$CUSTOMFILE" commit.gpgsign false
      git config --global user.email "james.newton@shopify.com"
    fi
  ;;
esac
