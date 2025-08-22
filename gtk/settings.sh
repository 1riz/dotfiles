#!/bin/bash

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface font-name 'DejaVuSans 11'

echo "gtk-theme:"
gsettings get org.gnome.desktop.interface gtk-theme
echo "icon-theme:"
gsettings get org.gnome.desktop.interface icon-theme
echo "cursor-theme:"
gsettings get org.gnome.desktop.interface cursor-theme
echo "color-scheme:"
gsettings get org.gnome.desktop.interface color-scheme
echo "font-name:"
gsettings get org.gnome.desktop.interface font-name
