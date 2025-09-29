#!/bin/sh
~/.config/dwm/apps.sh list | dmenu "$@" | ~/.config/dwm/apps.sh
