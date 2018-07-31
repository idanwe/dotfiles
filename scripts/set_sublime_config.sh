#!/bin/bash

source `dirname $0`/../framework

header "Set sublime config"

SUBL_DIR=~/Library/Application\ Support/Sublime\ Text\ 3

echo "$SUBL_DIR/Packages"
rm -rf "$SUBL_DIR/Packages"
rm -rf "$SUBL_DIR/Installed Packages"

symlink "$DOTF/sublime/Packages" "$SUBL_DIR/Packages"
symlink "$DOTF/sublime/Installed Packages" "$SUBL_DIR/Installed Packages"