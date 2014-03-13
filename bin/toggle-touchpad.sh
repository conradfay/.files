#!/bin/bash

# If touch pad is on
if synclient | grep 'TouchpadOff.*0' > /dev/null
then # Turn it off
    synclient TouchpadOff=1
    echo "Touchpad turned off."
    notify-send "Touchpad turned off." -h string:synchronous:volume -i "input-mouse"
else # Turn it on
    synclient TouchpadOff=0
    # Turn off wheel emulation on trackpoint.
    echo "Touchpad turned on"
    notify-send "Touchpad turned on." -h string:synchronous:volume -i "input-mouse"
fi
