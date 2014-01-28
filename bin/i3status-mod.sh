#!/bin/bash

i3status | while :
do
  # Volume
  volStatus=$(amixer get Master | tail -n 1 | cut -d '[' -f 3 | sed 's/].*//g')
  volLevel=$(amixer get Master | tail -n 1 | cut -d '[' -f 2 | sed 's/\%].*//g')
  headphone=$(amixer -c 0 contents | grep 18 -A 2 | awk 'NR==3 { print $2 }' | cut -d '=' -f 2)
  if [ "$volStatus" == "on" ] && [ "$headphone" == "off" ];
          then icon="⮞"
  elif [ "$volStatus" == "on" ] && [ "$headphone" == "on" ];
          then icon="⮜"
  elif [ "$volStatus" == "off" ] && [ "$headphone" == "on" ];
          then icon="⮜"
  elif [ "$volStatus" == "off" ] && [ "$headphone" == "off" ];
          then icon="⮝"
  else icon="⮝"
  fi
  #icon="vol:"
  VOL="$icon $volLevel"

  # Signal
  signalStrength=$(cat /proc/net/wireless | awk 'NR==3 { print $3}' | sed 's/\.//')

  if [ "$signalStrength" -gt 64 ]
  then
          SIG="‗▬▪▮"
  elif [ "$signalStrength" -lt 65 ] && [ "$signalStrength" -gt 39 ]
  then
          SIG="‗▬▪ ▮"
  elif [ "$signalStrength" -lt 40 ]
  then
          SIG="‗▬ ▪▮"
  else
          SIG="‗▬▪▮ Not connected"
  fi

  # Battery
  batStats=$(acpi --battery | cut -d' ' -f3 | sed 's/,//')
  if [ "$batStats" == "" ]
  then
          icon="⮎"
          batLevel="AC"
  elif [ "$batStats" == "Charging" ]
  then
          icon="⮑"
          batLevel=$(acpi --battery | cut -d' ' -f4 | sed 's/%,//')"+"
  elif [ "$batStats" == "Discharging" ]
  then
          icon="⮑"
          batLevel=$(acpi --battery | cut -d' ' -f4 | sed 's/%,//')"-"
  else    
          icon="⮒"
          batLevel=""
  fi
  #icon="bat:"
  BAT="$icon $batLevel"


  # Date
  icon="⭧"
  date=$(date "+%a %m/%d/%y %R:%S")
  #icon=""
  DATE="$icon $date"

  # MPD
  MPD=''
  mpc -f "%artist% - %album% - %title%" | grep -E 'playing|paused' > /dev/null
  if [ $? -eq 0 ]; then
    MPD="mpd: `mpc -f "%artist% - %album% - %title% | " | head -n 1`"
  fi

  echo -n $VOL '|' $BAT '|' $DATE || exit 1
  sleep 1
done
