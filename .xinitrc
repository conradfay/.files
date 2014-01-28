# Startup applications
dropboxd &
redshift -l 38.4829:-121.6398 &
compton &
nitrogen --restore
pulseaudio --start
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

# bspwm
sxhkd &
exec bspwm -s "$PANEL_FIFO" -p W
