xrdb ~/.Xresources
#export BROWSER=luakit

case $1 in
chromeos)
    exec chromeos
    ;;
awesome)
    exec awesome
    ;;
cinnamon)
    exec cinnamon
    ;;
xfce4-session)
    exec xfce4-session
    ;;
dwm)
    exec dwm
    ;;
gnome-shell)
    exec gnome-shell
    ;;
i3-gnome)
    exec i3-gnome
    ;;
wmii)
    exec wmii
    ;;
i3|*)
    exec i3
    ;;
esac

