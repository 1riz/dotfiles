#!/bin/bash

if [[ "${1}" == "list" ]]; then

  echo -e " Foot            Terminal Emulator\tfoot"
  echo -e "󰈹 Firefox         Web Browser\tfirefox"
  echo -e "󰖟 Elinks          Text Web Browser\telinks"
  echo -e " Neovim          Code Editor\tnvim"
  echo -e " Tmux            Terminal Multiplexer\ttmux"
  echo -e " NNN             File Manager\tnnn"
  echo -e " BTop            Resource Monitor\tbtop"
  echo -e " HTop            Process Viewer\thtop"
  echo -e " Lazygit         Version Control\tlazygit"
  echo -e "󰓇 NCSpot          Music Player\tncspot"
  echo -e "󰝚 Cava            Audio Visualizer\tcava"
  echo -e " Qalc            Advanced Calculator\tqalc"
  echo -e " Peaclock        Digital Clock\tpeaclock"
  echo -e " QEMU            Emulator (OpenBSD)\tqemu"
  echo -e " Dosbox          Emulator (DOS)\tdosbox"
  echo -e " Pavucontrol     Volume Control\tpavucontrol"

else

  APP=$(</dev/stdin)

  case "${APP}" in
    foot)
      riverctl spawn 'foot'
      ;;
    firefox)
      riverctl spawn '/usr/lib/firefox/firefox'
      ;;
    elinks)
      riverctl spawn 'exec foot -a elinks -T elinks elinks'
      ;;
    nvim)
      riverctl spawn 'foot -c ~/.config/foot/foot_github.ini -a neovim nvim'
      ;;
    tmux)
      riverctl spawn 'foot -a tmux tmux new-session -A -s DEV'
      ;;
    nnn)
      riverctl spawn 'foot -c ~/.config/foot/foot_nightfox.ini -a nnn -T nnn bash -c "NNN_OPENER=nuke GUI=1 nnn -cdQTv"'
      ;;
    btop)
      riverctl spawn 'foot -a btop -T btop btop'
      ;;
    htop)
      riverctl spawn 'foot -a htop -T htop htop'
      ;;
    lazygit)
      riverctl spawn 'foot -a lazygit -T lazygit lazygit'
      ;;
    ncspot)
      riverctl spawn 'exec foot -a ncspot -T ncspot ncspot'
      ;;
    cava)
      riverctl spawn 'exec foot -o colors.alpha=0.6 -a cava -T cava cava'
      ;;
    qalc)
      riverctl spawn 'foot -c ~/.config/foot/foot_nightfox.ini -a qalc -T qalc -W 100x20 qalc -c'
      ;;
    peaclock)
      riverctl spawn 'foot -a peaclock -T peaclock peaclock --config-dir ~/.config/peaclock'
      ;;
    qemu)
      riverctl spawn "${HOME}/Projects/QEMU/openbsd/bin/run.sh"
      ;;
    dosbox)
      riverctl spawn 'dosbox ~/Projects/DOS/devel'
      ;;
    pavucontrol)
      riverctl spawn 'pavucontrol'
      ;;
  esac

fi
exit 0
