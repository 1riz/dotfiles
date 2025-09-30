#!/bin/sh

export PATH=$HOME/.local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/opt/bin:/usr/local/bin:/usr/local/sbin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export CM_DIR=$HOME/.cache/clipmenu

if [ -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
  eval $(dbus-launch --sh-syntax --exit-with-x11)
fi
if [ "${SSH_AGENT_PID}" ]; then
  ssh-add -D < /dev/null
  eval $(ssh-agent -s -k)
fi

xset -dpms
xset -b
xset s off
xset r rate 300 50
xrdb -merge ~/.config/dwm/xcursor.conf
xrdb -merge ~/.config/xterm/xresources
xsetroot -solid "#0d1117"
sndioctl -q output.level=0.7
sndioctl -q input.level=0.7
sndioctl -q output.mute=1
sndioctl -q input.mute=1
xbacklight -set 50

pkill -qf xsel
pkill -qf clipmenud
clipmenud &

pkill -qf xbanish
xbanish -i all -t 10 &

pkill -SIGKILL -qf ~/.config/dwm/statusbar.sh
~/.config/dwm/statusbar.sh &

dwm
