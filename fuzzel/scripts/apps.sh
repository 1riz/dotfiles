#!/bin/bash

if [[ "${1}" == "list" ]]; then

  echo -e "󰘔   Foot\tfoot"
  echo -e "󰘔   Firefox\tfirefox"
  echo -e "󰘔   Neovim\tnvim"
  echo -e "󰘔   Tmux\ttmux"
  echo -e "󰘔   NNN\tnnn"
  echo -e "󰘔   BTop\tbtop"
  echo -e "󰘔   HTop\thtop"
  echo -e "󰘔   Lazygit\tlazygit"
  echo -e "󰘔   NCSpot\tncspot"
  echo -e "󰘔   Qalc\tqalc"
  echo -e "󰘔   QEMU\tqemu"
  echo -e "󰘔   Dosbox\tdosbox"
  echo -e "󰘔   Pavucontrol\tpavucontrol"

else

  APP=$(</dev/stdin)

  case "${APP}" in
    foot)
      coproc { foot; }
      ;;
    firefox)
      coproc { /usr/lib/firefox/firefox; }
      ;;
    nvim)
      coproc { foot -c ~/.config/foot/foot_github.ini -a neovim nvim; }
      ;;
    tmux)
      coproc { foot -a tmux tmux new-session -A -s DEV; }
      ;;
    nnn)
      coproc { foot -c ~/.config/foot/foot_nightfox.ini -a nnn -T nnn nnn -deoQTv; }
      ;;
    btop)
      coproc { foot -a btop -T btop btop; }
      ;;
    htop)
      coproc { foot -a htop -T htop htop; }
      ;;
    lazygit)
      coproc { foot -a lazygit -T lazygit lazygit; }
      ;;
    ncspot)
      coproc { exec foot -a ncspot -T ncspot ncspot; }
      ;;
    qalc)
      coproc { foot -c ~/.config/foot/foot_nightfox.ini -a qalc -T qalc -W 100x20 qalc -c; }
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
