#!/bin/bash

if [[ "${1}" == "list" ]]; then
  fd -t f . "${HOME}"
else
  FILE=$(</dev/stdin)
  swaymsg exec "foot -a nuke -T nuke nuke ${FILE}"
fi
