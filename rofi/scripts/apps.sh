#!/bin/bash

echo -en "\0prompt\x1fapps\n"

if [[ ${ROFI_RETV} == 0 ]]; then

  echo -en "foot\0display\x1f Foot\x1ficon\x1ffoot\n"
  echo -en "firefox\0display\x1f Firefox\x1ficon\x1ffirefox\n"
  echo -en "waterfox\0display\x1f Waterfox\x1ficon\x1fwaterfox\n"
  echo -en "nvim\0display\x1f Neovim\x1ficon\x1fneovim\n"
  echo -en "tmux\0display\x1f Tmux\x1ficon\x1ftmux\n"
  echo -en "thunar\0display\x1f Thunar\x1ficon\x1fthunar\n"
  echo -en "nnn\0display\x1f NNN\x1ficon\x1fnnn\n"
  echo -en "btop\0display\x1f BTop\x1ficon\x1fbtop\n"
  echo -en "htop\0display\x1f HTop\x1ficon\x1fhtop\n"
  echo -en "ncspot\0display\x1f NCSpot\x1ficon\x1fncspot\n"
  echo -en "qalc\0display\x1f Qalc\x1ficon\x1faccessories-calculator\n"
  echo -en "qemu\0display\x1f QEMU\x1ficon\x1fqemu\n"
  echo -en "dosbox\0display\x1f Dosbox\x1ficon\x1fdosbox\n"
  echo -en "pavucontrol\0display\x1f Pavucontrol\x1ficon\x1faudio-speakers\n"

elif [[ ${ROFI_RETV} == 1 ]]; then

  case "${1}" in
    foot)
      coproc { foot; }
      ;;
    firefox)
      coproc { /usr/lib/firefox/firefox; }
      ;;
    waterfox)
      coproc { /opt/waterfox/waterfox; }
      ;;
    nvim)
      coproc { foot -c ~/.config/foot/foot_catppuccin.ini -a neovim -W 140x60 -e nvim; }
      ;;
    thunar)
      coproc { thunar; }
      ;;
    btop)
      coproc { foot -a btop -T btop -e btop; }
      ;;
    htop)
      coproc { foot -a htop -T htop -e htop; }
      ;;
    ncspot)
      coproc { foot -a ncspot -T ncspot -e ncspot; }
      ;;
    nnn)
      coproc { foot -c ~/.config/foot/foot_nightfox.ini -a nnn -T nnn -e nnn -deoQTv; }
      ;;
    tmux)
      coproc { foot -a tmux -W 140x60 -e tmux new-session -A -s DEV; }
      ;;
    qalc)
      coproc { foot -c ~/.config/foot/foot_nightfox.ini -a qalc -T qalc -W 100x20 -e qalc -c; }
      ;;
    qemu)
      coproc { ~/Projects/QEMU/openbsd/bin/run.sh; }
      ;;
    dosbox)
      coproc { dosbox ~/Projects/DOS/devel; }
      ;;
    pavucontrol)
      coproc { pavucontrol; }
      ;;
  esac

fi
exit 0
