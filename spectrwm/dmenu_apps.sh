#!/bin/sh

~/.config/spectrwm/apps.sh list | dmenu -fn "${1}" -nb "${2}" -nf "${3}" -sb "${4}" -sf "${5}" | ~/.config/spectrwm/apps.sh
