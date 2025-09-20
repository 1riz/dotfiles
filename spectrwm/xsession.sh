#!/bin/sh

export PATH=$HOME/.local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export CM_DIR=$HOME/.cache/clipmenu
export CM_LAUNCHER=fzf

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
  eval `dbus-launch --sh-syntax --exit-with-x11`
fi

xset -dpms
xset -b
xset s off
xset r rate 300 50
feh --no-fehbg --bg-fill ~/Pictures/Wallpapers/unix-blue-digital-logo.png
sndioctl -q output.level=0.7
sndioctl -q input.level=0.7
sndioctl -q output.mute=1
sndioctl -q input.mute=1
xbacklight -set 50

pkill -qf xsel
pkill -qf clipmenud
clipmenud &

exec spectrwm > ~/.local/state/spectrwm/spectrwm.log 2>&1
