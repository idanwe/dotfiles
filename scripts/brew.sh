#!/bin/bash

source `dirname $0`/../framework

bullet 'Installing brew formulaes'

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew_install bash
brew_tap homebrew/versions
brew_install bash-completion2

brew_install homebrew/completions/brew-cask-completion

# Install wget with IRI support
brew_install wget --with-iri

# Install more recent versions of some OS X tools
brew_install git                            #*** Distributed revision control system
brew_install diff-so-fancy                  #*** Good-lookin' diffs. Actually… nah… The best-lookin' diffs.
brew_install nvm                           # This installs `npm` too using the recommended installation method
brew_install mongodb
brew_install yarn
brew_install wifi-password                  #*** Get the password of the wifi you're on

# cli utils
brew_install terminal-notifier              #*** Send OS X User Notifications from the command-line

# Remove outdated versions from the cellar
brew cleanup
