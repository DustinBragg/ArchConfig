#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="${PATH}:${HOME}/Shortcuts"
export QT_QPA_PLATFORMTHEME="qt5ct"
export WINIT_X11_SCALE_FACTOR=1.0

alias ls='ls --color=auto'
alias grep='grep --color=auto'

. "${HOME}/Scripts/Aliases.sh"

PS1='\[\033[93m\]\u@\h \[\033[97m\](\[\033[37m\]\W\[\033[97m\]) - \[\033[39m\]\[\033[0m\]'

