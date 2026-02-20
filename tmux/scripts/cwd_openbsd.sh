#!/bin/ksh

pane_cwd=$(basename "${1}")

if [[ $pane_cwd == $(whoami) ]]; then
  echo "home"
else
  echo "${pane_cwd}"
fi
