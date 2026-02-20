#!/bin/ksh

ssh_cmd=$(ps -o command -t "${1}" | rg ssh)

if [[ $ssh_cmd == ssh* ]]; then
  echo "${ssh_cmd}" | cut -d "@" -f 2
else
  echo "localhost"
fi
