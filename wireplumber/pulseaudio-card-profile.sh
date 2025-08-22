#!/bin/bash

if [[ "${1}" == "hdmi-speaker" ]]; then
  pactl set-card-profile alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic "HiFi (HDMI1, HDMI2, HDMI3, Mic1, Mic2, Speaker)"
  echo "Audio profile selected: HiFi (HDMI + Speaker)"
elif [[ "${1}" == "hdmi-mic" ]]; then
  pactl set-card-profile alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic "HiFi (HDMI1, HDMI2, HDMI3, Headphones, Mic1, Mic2)"
  echo "Audio profile selected: HiFi (HDMI + Mic)"
fi
