#!/bin/bash
wpctl set-mute $(pw-cli info alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink | grep -oP 'id: \K\w+') toggle
wpctl set-mute $(pw-cli info alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__HDMI1__sink | grep -oP 'id: \K\w+') toggle
wpctl set-mute $(pw-cli info alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Headphones__sink | grep -oP 'id: \K\w+') toggle
