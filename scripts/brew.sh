#!/bin/bash

source `dirname $0`/../framework

bullet 'Installing brew formulaes'

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# GNU core utilities (those that come with OS X are outdated)
brew_install coreutils
brew_install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew_install findutils
# GNU `sed`, overwriting the built-in `sed`
brew_install gnu-sed --default-names


# Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew_install bash
brew_tap homebrew/versions
brew_install bash-completion2

brew_install homebrew/completions/brew-cask-completion

# Install wget with IRI support
brew_install wget --with-iri

# Install more recent versions of some OS X tools
brew_install vim --override-system-vi
brew_install homebrew/dupes/grep
brew_install homebrew/dupes/openssh
brew_install homebrew/dupes/screen

brew_install git                            #*** Distributed revision control system
brew_install diff-so-fancy
brew_install node                           # This installs `npm` too using the recommended installation method

brew_install ssh-copy-id                    #*** Add a public key to a remote machine's authorized_keys file
brew_install imagemagick --with-webp        #*** Tools and libraries to manipulate images in many formats
brew_install ffmpeg --with-libvpx           #*** Play, record, convert, and stream audio and video
brew_install wifi-password                  #*** Get the password of the wifi you're on

# cli utils
brew_install tree                           #*** isplay directories as trees (with optional color/HTML output

brew_install terminal-notifier              #*** Send OS X User Notifications from the command-line

brew_install zsh                            #*** UNIX shell (command interpreter)
brew_install tmux                           #*** Terminal multiplexer

# Remove outdated versions from the cellar
brew cleanup
