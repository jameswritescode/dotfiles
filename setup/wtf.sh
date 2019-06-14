#!/bin/bash

# shellcheck source=/dev/null
source "${BASH_SOURCE%/*}/helpers/github.sh"

pushd /tmp || exit
  wget "$(getLatestReleaseURL wtfutil wtf darwin_amd64)"
  tar zxf wtf_*.gz

  pushd wtf_*/ || exit
    mv wtf /usr/local/bin
  popd || exit

  rm -rf wtf_*
popd || exit

mkdir -p "$HOME/.config/wtf"
ln -s "$DOTFILES/wtf.yml" "$HOME/.config/wtf/config.yml"
