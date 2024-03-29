# source: https://github.com/elentok/dotfiles

# Setup {{{1

# Subject the prompt string through parameter expansion, command substitution
# and arithmetic expansion:
setopt PROMPT_SUBST

# Random animals {{{1

# Credit to https://github.com/aviaron
function random_food {
  # FIRST_ANIMAL=128045 orig
  FIRST_FOOD=127815
  ICONS_COUNT=40
  UTF_CODE=$(( $RANDOM % $ICONS_COUNT + $FIRST_FOOD ))
  EMOJI="\U`printf '%x\n' $UTF_CODE`"
  echo -n $EMOJI
}

if [ "$(uname -s)" = "Darwin" ]; then
  random_food="$(random_food)  "
fi

# Exit code {{{1
success="%F{green}❯%f"
error="%F{red}❯%f"
exit_code="%(?.$success.$error) "

# Directory {{{1
directory="%F{cyan}%~%f"

# User and host {{{1
user_and_host="%{\$fg_bold[black]%}$USERNAME at $(hostname)%f"
user="%{\$fg_bold[white]%}$USERNAME"

# Git {{{1

# required zsh modules
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz colors && colors

# refresh the git status before every command
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true # required to show staged/unstaged
zstyle ':vcs_info:*' use-simple true # faster, but less accurate
zstyle ':vcs_info:*' stagedstr '%F{green}✗%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}✗%f'
zstyle ':vcs_info:*' formats '(%F{green}%b%f%u%c)'
zstyle ':vcs_info:*' actionformats '%F{green}%b%f%u%c (%a)'
# zstyle ':vcs_info:*' formats ' at %F{green}%b%f%u%c'
# zstyle ':vcs_info:*' actionformats ' at %F{green}%b%f%u%c (%a)'

git_status='${vcs_info_msg_0_}'

# Full prompt {{{1

# PROMPT="$user $random_food $directory$git_status
# $exit_code"

PROMPT="$directory $random_food$git_status $exit_code"
