#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#[[ $TERM != "screen" ]] && exec tmux

export EDITOR=vim
export PYTHONPATH=/usr/lib/python3.3/site-packages

alias hack='~/Scripts/hack.exe'
alias controlpanel='lua ~/Scripts/3spooky.lua'
alias supersplit='~/Dropbox/Scripts/supersplit.sh'
alias multimon='xrandr --output HDMI1 --mode 1440x900 --left-of LVDS1'
alias topmon='xrandr --output HDMI1 --mode 1440x900;xrandr --output LVDS1 --off'

alias ls='ls --color=auto'

PS1='\[\033[0;34m\][\w]=>\[\033[0;0m\]'
#export PS1="%{;05;8;48;05;4m%} %(!.%S-ROOT-%s.%n) %{;05;4;48;05;1m%}⮀%{0m%}%{;05;8;48;05;1m%} %~ %{0m%}%{;05;1m%}⮀ %{0m%}"

