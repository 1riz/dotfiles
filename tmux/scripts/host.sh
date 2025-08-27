#!/bin/bash

ssh_cmd=$(ps -h -o cmd -t "${1}" | rg ssh)

if [[ $ssh_cmd == ssh* ]]; then
  echo "${ssh_cmd}" | cut -d "@" -f 2
else
  echo "localhost"
  # cat /etc/hostname
fi
