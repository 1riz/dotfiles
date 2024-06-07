#!/bin/bash

echo -en "\0prompt\x1ffiles\n"

if [[ ${ROFI_RETV} == 0 ]]; then
  fd -u -c never -E '.cache' -E '.git'
elif [[ ${ROFI_RETV} == 1 ]]; then
  coproc { alacritty --config-file ~/.config/alacritty/alacritty_floating.toml -T "xdg-open" -e xdg-open "${1}"; }
fi

exit 0
