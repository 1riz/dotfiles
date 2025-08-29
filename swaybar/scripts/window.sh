#!/bin/bash

# Based on https://github.com/vivien/i3blocks-contrib/blob/master/sway-focusedwindow/sway-focusedwindow

app_id=$(swaymsg -t get_tree | jq --unbuffered -r '.. | select(.focused?) | .app_id')
if [[ "$app_id" != "null" ]]; then
  echo "$app_id"
fi

subscribe_query='select(.container.focused and .change == "focus") | .container.app_id'
swaymsg -m -t subscribe "['window']" | jq --unbuffered -r "$subscribe_query"
