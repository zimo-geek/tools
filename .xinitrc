#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

export XIM=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XIM_PROGRAM=fcitx5
export XMODIFIERS="@im=fcitx5"
export SDL_IM_MODULE=fcitx5
fcitx5 &

erresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

case "$1" in
    awesome) exec /usr/bin/awesome ;;
    openbox) exec openbox-session ;;
    xfce4) exec startxfce4 ;;
    KDE3|kde3) exec startkde ;;
    gnome) exec gnome-session ;;
    e17) exec /usr/bin/enlightenment_start ;;
    ratpoison) exec ratpoison ;;
    wmii) exec wmii ;;
    *) exec  /usr/bin/awesome ;;
esac

