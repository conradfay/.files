#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias supersplit='~/Dropbox/Scripts/supersplit.sh'
alias xm='xmms2'
alias multimon='xrandr --output HDMI1 --mode 1440x900 --above LVDS1;xrandr --output LVDS1 --mode 1366x768 --below HDMI1'
alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1="[\w]$"
PS1='\[\033[0;31m\][\w]=>\033[0;38m\]'
#PS1='\[\033[31m\]>'
#PS1=">"
