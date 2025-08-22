#!/bin/bash

rm -f ~/.config/mimeapps.list

xdg-settings set default-web-browser firefox.desktop

xdg-mime default org.pwmt.zathura-pdf-poppler.desktop application/pdf

xdg-mime default imv.desktop image/bmp image/gif image/jpeg image/jpg image/pjpeg image/png image/tiff image/x-bmp image/x-pcx image/x-png image/x-portable-anymap image/x-portable-bitmap image/x-portable-graymap image/x-portable-pixmap image/x-tga image/x-xbitmap image/heif image/avif

cat ~/.config/mimeapps.list
