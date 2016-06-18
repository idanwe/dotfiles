# Load our dotfiles like ~/.exports, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{exports,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file
