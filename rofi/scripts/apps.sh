#!/bin/bash

echo -en "\0prompt\x1fapps\n"

if [[ ${ROFI_RETV} == 0 ]]; then

  echo -en "alacritty\0display\x1f Alacritty\x1ficon\x1falacritty\n"
  echo -en "firefox\0display\x1f Firefox\x1ficon\x1ffirefox\n"
  echo -en "waterfox\0display\x1f Waterfox\x1ficon\x1fwaterfox\n"
  echo -en "nvim\0display\x1f Neovim\x1ficon\x1fneovim\n"
  echo -en "thunar\0display\x1f Thunar\x1ficon\x1fthunar\n"
  echo -en "btop\0display\x1f BTop\x1ficon\x1fbtop\n"
  echo -en "htop\0display\x1f HTop\x1ficon\x1fhtop\n"
  echo -en "ncspot\0display\x1f NCSpot\x1ficon\x1fncspot\n"
  echo -en "nnn\0display\x1f NNN\x1ficon\x1fnnn\n"
  echo -en "qalc\0display\x1f Qalc\x1ficon\x1faccessories-calculator\n"
  echo -en "qemu\0display\x1f QEMU\x1ficon\x1fqemu\n"
  echo -en "dosbox\0display\x1f Dosbox\x1ficon\x1fdosbox\n"

elif [[ ${ROFI_RETV} == 1 ]]; then

  case "${1}" in
    alacritty)
      coproc { alacritty; }
      ;;
    firefox)
      coproc { /usr/lib/firefox/firefox; }
      ;;
    waterfox)
      coproc { /opt/waterfox/waterfox; }
      ;;
    nvim)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_nightfox.toml -o 'window.class.general="neovim"' -o 'window.dimensions.lines=50' -o 'window.dimensions.columns=140' -e nvim; }
      ;;
    thunar)
      coproc { thunar; }
      ;;
    btop)
      coproc { alacritty -T "btop" -o 'window.class.general="btop"' -e btop; }
      ;;
    ncspot)
      coproc { alacritty -T "ncspot" -o 'window.class.general="ncspot"' -e ncspot; }
      ;;
    nnn)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_nightfox.toml -T "nnn" -o 'window.class.general="nnn"' -e nnn -deoQTv; }
      ;;
    qalc)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_nightfox.toml -T "qalc" -o 'window.class.general="qcalc"' -o 'window.dimensions.lines=20' -o 'window.dimensions.columns=100' -e qalc -c; }
      ;;
    qemu)
      coproc { ~/Projects/QEMU/openbsd/bin/run.sh; }
      ;;
    dosbox)
      coproc { dosbox ~/Projects/DOS/devel; }
      ;;
  esac

fi
exit 0
