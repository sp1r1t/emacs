#!/bin/sh

# launch dbus daemon
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources # update x resource db

# set background
#echo "setting background"
#feh --bg-fill ~/medien/pix/walls/balls.jpg
# for random background:
# $ feh --randomize --bg-fill ~/.wallpaper/*

# start emacs daemon
#emacs --daemon > /dev/null &

# run desktop conky panel
#conky -c ~/.config/conky/rightpanel.conky
#conky -c ~/.conky/left.conky &
#conky -c ~/.conky/middle.conky &
#conky -c ~/.conky/right.conky &

# run xcompmgr for transperancy
#xcompmgr &

# dual screen setup
xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --output LVDS1 --primary --pos 1920x603 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output VGA1 --off --output VIRTUAL1 --off
#xrandr --output LVDS1 --primary --mode 1280x720 --pos 1920x571 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output VGA1 --off --output VIRTUAL1 --off
#xrandr --auto --output LVDS1 --right-of HDMI1 --auto --primary
#~/.screenlayout/screen-setup.sh
xrandr --output HDMI-A-0 --auto --left-of DisplayPort-0

exec awesome # start awesome
#exec fluxbox
#exec gnome-session
#exec herbstluftwm --locked
