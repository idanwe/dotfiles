#!/bin/bash
#
# idanwe's dotfiles

source `dirname $0`/framework

install_brew() {
  header 'Homebrew'
  if command_missing brew; then
    ./scripts/homebrew-install.sh
  fi

  ./scripts/brew.sh
  ./scripts/brew-cask.sh
}

install_zsh() {
  ./scripts/install-zsh.sh
}

install_common() {
  header 'Install Common'

  # install nvm
  bullet "Installing nvm"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

  # install meteor
  bullet "Installing meteor"
  npm_install meteor

  # change to bash 4 (installed by homebrew)
  BASHPATH=$(brew --prefix)/bin/bash
  #sudo echo $BASHPATH >> /etc/shells
  sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
  chsh -s $BASHPATH # will set for current user only.
  echo $BASH_VERSION # should be 4.x not the old 3.2.X
  # Later, confirm iterm settings aren't conflicting.

  # Install the Flat theme for iTerm
  # open "$DOTF/configs/Flat.itermcolors"
}

install_symlinks() {
  header 'Install symlinks'

  symlink "$DOTF/dots/bash_profile" ~/.bash_profile
  symlink "$DOTF/dots/git/gitconfig" ~/.gitconfig
  symlink "$DOTF/dots/git/gitignore_global" ~/.gitignore_global
}

# tune_global_npm_no_sudo() {
#   header 'Tune global npm without sudo'
#   # source: https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md

#   # Create a directory for globally packages
#   [ -d "${HOME}/.npm-packages"] || mkdir "${HOME}/.npm-packages"

#   # Indicate to npm where to store globally installed packages. In your ~/.npmrc file add
#   echo "prefix=${HOME}/.npm-packages" >> ~/.npmrc

#   # Ensure npm will find installed binaries and man pages. Add the following to your .bashrc/.zshrc:
#   echo 'NPM_PACKAGES="${HOME}/.npm-packages"' >> ~/.zshrc
#   echo 'PATH="$NPM_PACKAGES/bin:$PATH"' >> ~/.zshrc

#   # Unset manpath so we can inherit from /etc/manpath via the `manpath` command
#   echo "unset MANPATH" >> ~/.zshrc # delete if you already modified MANPATH elsewhere in your config
#   echo 'export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"' >> ~/.zshrc
# }

# run the install function
# install_brew
install_zsh
# install_common
install_symlinks
# tune_global_npm_no_sudo
