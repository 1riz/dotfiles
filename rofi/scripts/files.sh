#!/bin/bash

echo -en "\0prompt\x1ffiles\n"

if [[ ${ROFI_RETV} == 0 ]]; then
  # fd -u -c never -E '.cache' -E '.git'
  fd -c never
elif [[ ${ROFI_RETV} == 1 ]]; then
  coproc { alacritty -T "xdg-open" -e xdg-open "${1}"; }
fi

exit 0
