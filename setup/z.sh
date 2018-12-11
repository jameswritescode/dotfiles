#!/bin/bash

pushd "$DOTFILES/z" || exit
  go build .
popd || exit

DIR="$DOTFILES/z"

ln -s "$DIR" "$GOPATH/src"
ln -s "$DIR/z" /usr/local/bin/z
