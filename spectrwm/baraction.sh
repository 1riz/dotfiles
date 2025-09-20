#!/bin/sh

print_cpu() {
  CPU_IDLE=$(top -b -d 2 -s 1 | rg ' idle$' | tail -n 1 | cut -d ',' -f 6 | cut -d "." -f 1)
  if [[ $CPU_IDLE == "  100% idle" ]]; then
    CPU=0
  else
    CPU=$((100 - $CPU_IDLE))
  fi
  echo -n "  ${CPU}%  "
}

print_mem() {
  MEM=$(top -b -d 1 | rg 'Free: ' | cut -d " " -f6)
  echo -n "    ${MEM}  "
}

print_net() {
  ifconfig axen0 | rg -q 'status: active'
  if [ $? -eq 0 ]; then
    NET="1Gb/s"
  else
    NET="OFF"
  fi
  echo -n "    ${NET}  "
}

print_snd() {
  if [ $(sndioctl output.mute | cut -d "=" -f2) -eq 1 ]; then
    echo -n "    0%  "
  else
    SND=$(sndioctl output.level | cut -d "=" -f2 | cut -d "." -f2)
    SND=$(($SND / 10))
    echo -n "    ${SND}%  "
  fi
}

print_bat() {
  BAT=$(apm -l)
  echo -n "    ${BAT}%  "
}

print_date() {
  DATE=$(date "+%a %d %b %H:%M:%S")
  echo -n "  ${DATE}  "
}

while :; do
  print_cpu
  print_mem
  print_net
  print_snd
  print_bat
  print_date
  echo ""
  sleep 5
done
