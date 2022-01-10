#!/bin/bash

source `dirname $0`/../framework

bullet 'Installing brew-cask formulaes'

# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew_install caskroom/cask/brew-cask
brew_tap caskroom/versions

# daily
brew_cask_install spectacle             # Window control with simple and customizable
# brew_cask_install gyazo               # The easy way to save screenshots, GIFs, and websites.
# brew_cask_install rescuetime          # RescueTime helps you understand your daily habits so you can focus and be more productive.
brew_cask_install flux                  # It makes the color of your computer's display adapt to the time of day, warm at night and like sunlight during the day.

# dev
brew_cask_install iterm2
brew_cask_install sublime-text
# brew_cask_install slack
brew_cask_install quicklook-json        # Quicly inspect json from finder

# browsers
# brew_cask_install google-chrome

# less often
# brew_cask_install disk-inventory-x
brew_cask_install vlc
