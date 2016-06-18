#!/bin/bash

source `dirname $0`/../framework

header 'Zsh'

function install_zsh() {
  brew_install zsh

  my_shell=$(echo $SHELL | rev | cut -d/ -f1 | rev)
  if [ "$my_shell" != "zsh" ]; then
    zsh_bin="$(which zsh)"
    bullet "Changing shell to ${zsh_bin}... "
    chsh -s "$zsh_bin"
  fi
}

function install_symlinks() {
  symlink "$DOTF/zsh" ~/.zsh
  symlink "$DOTF/zsh/zshrc" ~/.zshrc
}

install_zsh
install_symlinks
