#!/bin/ksh

if [[ "${1}" == "list" ]]; then

  echo -e "st"
  echo -e "xterm"
  echo -e "firefox"
  echo -e "lynx"
  echo -e "neovim"
  echo -e "vim"
  echo -e "vi"
  echo -e "tmux"
  echo -e "nnn"
  echo -e "feh"
  echo -e "btop"
  echo -e "htop"
  echo -e "xclock"
  echo -e "bc"
  echo -e "spotify"

else

  app=$(< /dev/stdin)
  set -A st_float_args -- "-c" "st-float" "-g" "100x20" "-s" "#0d1117@259" "-s" "#e6edf3@258" "-f" "FiraCodeNerdFont:pixelsize=14:antialias=true:autohint=true"

  case "${app}" in
    st)
      st &
      ;;
    xterm)
      xterm &
      ;;
    firefox)
      firefox &
      ;;
    lynx)
      st -T lynx -e lynx -cfg=~/.config/lynx/lynx.cfg &
      ;;
    neovim)
      st -e nvim &
      ;;
    vim)
      st -T vim -e vim &
      ;;
    vi)
      st -T vi -e vi &
      ;;
    tmux)
      st -e tmux -f ~/.config/tmux/tmux.conf new-session -A -s DEV &
      ;;
    nnn)
      st "${st_float_args[@]}" -T nnn -e nnn -QTv &
      ;;
    feh)
      feh ~/Pictures/Posters/*.png &
      ;;
    btop)
      st -T btop -e btop &
      ;;
    htop)
      st -T htop -e htop &
      ;;
    xclock)
      xclock &
      ;;
    bc)
      st "${st_float_args[@]}" -T bc -e bc -l &
      ;;
    spotify)
      st -T spotify_player -e spotify_player &
      ;;
  esac

fi
