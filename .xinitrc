xrdb ~/.Xresources
#export BROWSER=luakit

case $1 in
openbox)
    exec openbox
    ;;
gnome-shell)
    exec gnome-shell
    ;;
awesome|*)
    exec awesome
    ;;
esac

