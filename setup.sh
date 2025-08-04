#!/bin/bash

set -xeuo pipefail

if [[ "$OSTYPE" = "darwin"* ]]; then
    scripts=(01_brew zsh rust neovim tmux fzf macos)

    for script in "${scripts[@]}"; do
        path="setup/$script.sh"
        read -rp "Press enter to run $path"
        ./"$path" install_macos
    done
elif [[ $(awk -F= '/^NAME/{print $2}' /etc/os-release 2>/dev/null) == '"Ubuntu"' ]]; then
    sudo apt-get install -y software-properties-common build-essential

    ./setup/git.sh install_ubuntu
    ./setup/zsh.sh install_ubuntu
    ./setup/python.sh install_ubuntu
    ./setup/node.sh install_ubuntu
    ./setup/fzf.sh install_ubuntu
    ./setup/neovim.sh install_ubuntu
else
    echo "unsupported operating system"
fi
