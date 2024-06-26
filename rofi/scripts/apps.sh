#!/bin/bash

echo -en "\0prompt\x1fapps\n"

if [[ ${ROFI_RETV} == 0 ]]; then

  echo -en "alacritty\0display\x1f󰆍  Alacritty\n"
  echo -en "firefox\0display\x1f  Firefox\n"
  echo -en "waterfox\0display\x1f󰖟  Waterfox\n"
  echo -en "tor\0display\x1f  TorBrowser\n"
  echo -en "nvim\0display\x1f  Neovim\n"
  echo -en "btop\0display\x1f  BTop\n"
  echo -en "ncspot\0display\x1f  NCSpot\n"
  echo -en "nnn\0display\x1f  NNN\n"
  echo -en "qalc\0display\x1f  Qalc\n"
  echo -en "fzf\0display\x1f  FZF\n"

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
    tor)
      coproc { /opt/tor-browser/Browser/start-tor-browser --detach; }
      ;;
    nvim)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_blue.toml -T "nvim" -e nvim; }
      ;;
    btop)
      coproc { alacritty -T "btop" -e btop; }
      ;;
    ncspot)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_floating.toml -T "ncspot" -e ncspot; }
      ;;
    nnn)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_floating_blue.toml -T "nnn" -e nnn -deoQTv; }
      ;;
    qalc)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_floating_blue.toml -o 'window.dimensions.lines=20' -o 'window.dimensions.columns=100' -T "qalc" -e qalc -c; }
      ;;
    fzf)
      coproc { alacritty --config-file ~/.config/alacritty/alacritty_floating.toml -T "fzf" -e fzf --bind 'enter:execute(bat --paging=always {})'; }
      ;;
  esac

fi
exit 0
