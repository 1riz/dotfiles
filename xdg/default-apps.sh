#!/bin/sh

rm -f ~/.config/mimeapps.list
xdg-settings set default-web-browser firefox.desktop
cat ~/.config/mimeapps.list
