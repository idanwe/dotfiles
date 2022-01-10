# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# mv, rm, cp
# alias mv='mv -v'
# alias rm='rm -i -v'
# alias cp='cp -v'

alias cask='brew cask' # i <3 u cask
alias where=which # sometimes i forget
alias brwe=brew  # typos

###
# time to upgrade `ls`

# use coreutils `ls` if possible…
hash gls >/dev/null 2>&1 || alias gls="ls"

# always use color, even when piping (to awk,grep,etc)
if gls --color > /dev/null 2>&1; then colorflag="--color"; else colorflag="-G"; fi;
export CLICOLOR_FORCE=1

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
alias ls='gls -AFh ${colorflag} --group-directories-first'
alias ll='ls -la'
alias lsd='ls -l | grep "^d"' # only directories
#    `la` defined in .functions
###

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"
alias fix_camera='sudo killall VDCAssistant'

# Shortcuts
alias g="git"

# File size
alias fs="stat -f \"%z bytes\""

# navigation shortcuts
alias godot="cd $DOTF"
alias go.="cd $DOTF"
alias god="cd $DEVELOPMENT_DIR"

alias subl.="subl $DOTF"

alias ip="ifconfig | grep netmask | grep broadcast"

alias music=spotify
alias sp="spotify play"
alias ss="spotify pause"
alias splay="sp"
alias SPLAY="sp"
alias דפךשט="sp"
alias spause="spotify pause"
alias sn="spotify next"
alias pn="sn"
alias PN="sn"
alias פנ="sn"
alias snext="sn"
alias SNEXT="sn"
alias דמקסא="sn"

############################################
# osx specific aliases
############################################

alias gg="git gui"

alias chrome="open -a ~/Applications/Google\ Chrome.app"

# Exclude OSX specific files in ZIP archives

alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"

# Start screen saver

alias afk="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"

# Empty trash on mounted volumes and main HDD, and clear system logs

alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
