#!/bin/bash
# a little script to disable compton compositer, if it is running, when executing a
# program.

if [ -z "$(pgrep compton)" ]
    then
        :
    else
        killall compton
        compton &
fi
exit
