#!/bin/bash

brew install gpg pinentry-mac
ln -s "$DOTFILES/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
killall gpg-agent
