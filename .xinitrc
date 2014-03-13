# Startup applications
synclient TouchpadOff=1
MouseID=`xinput list "TPPS/2 IBM TrackPoint" 2>/dev/null|grep id=|sed -e "s/.*id=\([0-9]*\).*/\1/"`
xinput --set-int-prop $MouseID "Evdev Wheel Emulation Button" 8 2
xinput --set-int-prop $MouseID "Evdev Wheel Emulation" 8 1
xrandr --output HDMI1 --mode 1440x900 --right-of LVDS1 --primary &
dropboxd &
#redshift -l 38.4829:-121.6398 &
compton &
nitrogen --restore
#pulseaudio --start
notify-send "Welcome back commander"
#comptoncheck.sh mplayer # execute compton, but not if it is running
#exec_always mpd-notify start

# Load .Xresources
xrdb ~/.Xresources

# Weird font stuff: for bar
xset +fp /usr/share/fonts/local
xset fp rehash

# Set default cursor
xsetroot -cursor_name left_ptr

exec i3
