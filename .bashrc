# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment variables
export EDITOR=vim
export PYTHONPATH=/usr/lib/python3.3/site-packages
export BROWSER=firefox
export PATH=$PATH:~/dotfiles/bin
export FONT=Lat2-Terminus16
export XMMS_PATH="tcp://192.168.1.10:5555"
export TERM=xterm-256color

# xrandr
alias multimon='xrandr --output HDMI1 --mode 1440x900 --left-of LVDS1; pactl set-card-profile 0 output:analog-stereo;'
alias topmon='xrandr --output HDMI1 --mode 1440x900;xrandr --output LVDS1 --off'
# sshfs
alias csifmount='sudo sshfs -o allow_other cfay@pc51.cs.ucdavis.edu:/home/cfay/ /media/net1/'
alias svmount='sshfs -o allow_other conradfay@conradfay.no-ip.biz:/ /media/net0/'
# Todo.txt
alias t='todo.sh'
complete -F _todo t
# Vim calendar
alias calendar='vim -c Calendar'
alias vcal='vim -c Calendar'
# Misc
# A trailing space in value causes the next word to be checked for alias 
#  substitution when the alias is expanded
alias sudo="sudo "
alias tp='trash-put'
alias ll='ls -l'
alias ls='ls --color=auto'
# Server utils
# alias svstream='mpv -ao pulse http://conradfay.no-ip.biz:8888/mpd.mp3'
# alias svcontrol='ncmpcpp -h conradfay.no-ip.biz'

# Console colorscheme
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01c1c1c" #black
    echo -en "\e]P8404040" #darkgrey
    echo -en "\e]P1b85335" #darkred
    echo -en "\e]P9Cf6a4c" #red
    echo -en "\e]P2799D6a" #darkgreen
    echo -en "\e]PA99ad6a" #green
    echo -en "\e]P3ffb964" #brown
    echo -en "\e]PBfad07a" #yellow
    echo -en "\e]P4667899" #darkblue
    echo -en "\e]PC8197bf" #blue
    echo -en "\e]P58787af" #darkmagenta
    echo -en "\e]PDc6b6ee" #magenta
    echo -en "\e]P6668799" #darkcyan
    echo -en "\e]PE8fbfdc" #cyan
    echo -en "\e]P7888888" #lightgrey
    echo -en "\e]PFe8e8d3" #white
    clear #for background artifacting
fi

# Custom prompt
PS1='\[\033[0;31m\][\w] » \[\033[0;0m\]'
