#!/bin/bash

i3status | while :
do
  VOL=`amixer get Master | egrep -o "[0-9]+%"`
  BAT=`acpi -b`
  DATE=`date "+%a %m/%d/%y %R:%S"`
  MPD=''
  mpc -f "%artist% - %album% - %title%" | grep -E 'playing|paused' > /dev/null
  if [ $? -eq 0 ]; then
    MPD="mpd: `mpc -f "%artist% - %album% - %title% | " | head -n 1`"
  fi
  echo -n $MPD "| vol:" $VOL '|' $BAT '|' $DATE || exit 1
  sleep 1
done
