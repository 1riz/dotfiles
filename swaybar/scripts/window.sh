#!/bin/bash

# Based on https://github.com/vivien/i3blocks-contrib/blob/master/sway-focusedwindow/sway-focusedwindow

subscribe_query='select(.container.focused and .change == "focus") | .container.app_id'
swaymsg -m -t subscribe "['window']" | jq --unbuffered -r "$subscribe_query"
