#!/bin/sh

if [[ "${1}" = "list" ]]; then

  echo -e "alacritty"
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
  echo -e "spotify"
  echo -e "bc"
  echo -e "clipmenu"

else

  APP=$(< /dev/stdin)

  case "${APP}" in
    alacritty)
      alacritty &
      ;;
    xterm)
      xterm &
      ;;
    firefox)
      firefox &
      ;;
    lynx)
      alacritty -T lynx -e lynx -cfg=~/.config/lynx/lynx.cfg &
      ;;
    neovim)
      alacritty -e nvim &
      ;;
    vim)
      alacritty -T vim -e vim &
      ;;
    vi)
      alacritty -T vi -e vi &
      ;;
    tmux)
      alacritty -e tmux -f ~/.config/tmux/tmux.conf new-session -A -s DEV &
      ;;
    nnn)
      alacritty --config-file ~/.config/alacritty/alacritty_github.toml -T nnn -e nnn -QTv &
      ;;
    feh)
      feh ~/Pictures/Posters/*.png &
      ;;
    btop)
      alacritty -T btop -e btop &
      ;;
    htop)
      alacritty -T htop -e htop &
      ;;
    xclock)
      xclock &
      ;;
    spotify)
      alacritty -T spotify_player -e spotify_player &
      ;;
    bc)
      alacritty --config-file ~/.config/alacritty/alacritty_github.toml -T bc -e bc -l &
      ;;
    clipmenu)
      alacritty --config-file ~/.config/alacritty/alacritty_github.toml -T clipmenu -e clipmenu &
      ;;
  esac

fi
