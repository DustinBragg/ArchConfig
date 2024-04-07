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

PS1='\e[93m\u@\h \e[97m(\e[37m\W\e[97m) - \e[39m'

