#!/bin/bash
#
# idanwe's dotfiles

source `dirname $0`/framework

##############################################################################################################
### XCode Command Line Tools
#      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh
install_xcode() {
  if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

  fi
}

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

  # Type `git open` to open the GitHub page or website for a repository.
  npm_install git-open

  # install nvm
  bullet "Installing nvm"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

  # install meteor
  bullet "Installing meteor"
  curl https://install.meteor.com/ | sh

  # change to bash 4 (installed by homebrew)
  BASHPATH=$(brew --prefix)/bin/bash
  #sudo echo $BASHPATH >> /etc/shells
  sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
  chsh -s $BASHPATH # will set for current user only.
  echo $BASH_VERSION # should be 4.x not the old 3.2.X
  # Later, confirm iterm settings aren't conflicting.

  # Install the Flat theme for iTerm
  open "$DOTF/configs/Flat.itermcolors"
}

install_osx_tuning() {
  ./scripts/osx-tuning.sh
}

install_symlinks() {
  header 'Install symlinks'

  symlink "$DOTF/dots/bash_profile" ~/.bash_profile
  # symlink "$DOTF/dots/.inputrc" ~
  symlink "$DOTF/dots/git/gitconfig" ~/.gitconfig
  symlink "$DOTF/dots/git/gitignore_global" ~/.gitignore_global
}

tune_global_npm_no_sudo() {
  header 'Tune global npm without sudo'
  # source: https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md

  # Create a directory for globally packages
  [ -d "${HOME}/.npm-packages"] || mkdir "${HOME}/.npm-packages"

  # Indicate to npm where to store globally installed packages. In your ~/.npmrc file add
  echo "prefix=${HOME}/.npm-packages" >> ~/.npmrc

  # Ensure npm will find installed binaries and man pages. Add the following to your .bashrc/.zshrc:
  echo 'NPM_PACKAGES="${HOME}/.npm-packages"' >> ~/.zshrc
  echo 'PATH="$NPM_PACKAGES/bin:$PATH"' >> ~/.zshrc

  # Unset manpath so we can inherit from /etc/manpath via the `manpath` command
  echo "unset MANPATH" >> ~/.zshrc # delete if you already modified MANPATH elsewhere in your config
  echo 'export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"' >> ~/.zshrc
}

set_sublime_config() {
  ./scripts/set_sublime_config.sh
}

# run the install function
install_xcode
install_brew
install_zsh
install_common
install_osx_tuning
install_symlinks
tune_global_npm_no_sudo
set_sublime_config
