#!/bin/bash

source `dirname $0`/../framework

bullet 'Installing homebrew'

# source: http://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
