#!/bin/bash

MouseID=`xinput list "TPPS/2 IBM TrackPoint" 2>/dev/null|grep id=|sed -e "s/.*id=\([0-9]*\).*/\1/"`

# If touch pad is on
if [ -e ~/.wheel-emu ]
then # Turn it off
    xinput --set-int-prop $MouseID "Evdev Wheel Emulation" 8 0
    echo "Wheel emulation turned off."
    notify-send "Wheel emulation turned off" -h string:synchronous:volume -i "input-mouse"
    export WHEEL_EMU=0
    rm ~/.wheel-emu
else # Turn it on
    xinput --set-int-prop $MouseID "Evdev Wheel Emulation Button" 8 2
    xinput --set-int-prop $MouseID "Evdev Wheel Emulation" 8 1
    echo "Wheel emulation turned on."
    notify-send "Wheel emulation turned on" -h string:synchronous:volume -i "input-mouse"
    touch ~/.wheel-emu
fi
