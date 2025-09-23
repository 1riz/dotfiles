#!/bin/sh

fastfetch_config="${XDG_CONFIG_HOME}/fastfetch/config-statusbar.jsonc"
fastfetch_out="${XDG_CACHE_HOME}/statusbar/fastfech.out"
net_device="axen0"

mkdir -p "${XDG_CACHE_HOME}/statusbar"

print_cpu() {
  cpu=$(sed -n '1p' "${fastfetch_out}")
  echo -n "    ${cpu}  "
}

print_mem() {
  mem=$(sed -n '2p' "${fastfetch_out}")
  echo -n "    ${mem}  "
}

print_disk() {
  disk=$(sed -n '3p' "${fastfetch_out}")
  echo -n "    ${disk}  "
}

print_temp() {
  temp=$(sed -n '4p' "${fastfetch_out}")
  echo -n "   ${temp}  "
}

print_net() {
  ifconfig "${net_device}" | rg -q 'status: active'
  if [ $? -eq 0 ]; then
    net="1Gb/s"
  else
    net="OFF"
  fi
  echo -n "    ${net}  "
}

print_snd() {
  snd=$(sed -n '5p' "${fastfetch_out}")
  echo -n "    ${snd}  "
}

print_bat() {
  bat=$(sed -n '6p' "${fastfetch_out}")
  echo -n "    ${bat}  "
}

print_date() {
  date=$(date "+%a %d %b %H:%M")
  echo -n "  ${date}  "
}

while :; do
  fastfetch -c "${fastfetch_config}" > "${fastfetch_out}"
  print_cpu
  print_mem
  print_disk
  print_temp
  print_net
  print_snd
  print_bat
  print_date
  echo ""
  sleep 5
done
