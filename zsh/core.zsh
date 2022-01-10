# sublime as default
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
export EDITOR="subl -w"

# Prefer US English and use UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export DOTL=~/.dotlocal
export DEVELOPMENT_DIR=~/Dev

source_if_exists() {
  if [ -e "$1" ]; then source $1; fi
}

source_if_exists "$DOTL/localzshrc"
