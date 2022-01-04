#!/bin/bash

install_omz() {
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    mv "$HOME/.zshrc" "$HOME/.zshrc.pre-dotfiles"
    ln -s "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
}

touch "$HOME/.zsh_custom"

case "$1" in
  install_macos)
    brew install zsh
    chsh -s /bin/zsh
    install_omz
  ;;

  install_ubuntu)
    if [[ -z $SPIN ]]; then
      sudo apt-get install -y zsh
      sudo chsh -s zsh
      install_omz
    else
      echo "source $HOME/dotfiles/zsh/partials/aliases.zsh" >> "$HOME/.zsh_custom"
      echo "source $HOME/dotfiles/zsh/partials/functions.zsh" >> "$HOME/.zsh_custom"
      echo "source $HOME/.zsh_custom" >> "$HOME/.zshrc"
    fi
  ;;
esac
