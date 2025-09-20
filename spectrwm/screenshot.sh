#!/bin/sh

screenshot() {
  FILE="${HOME}/Pictures/Screenshots/%Y-%m-%d_%H%M%S.png"
  case $1 in
    full)
      scrot -m "${FILE}"
      ;;
    window)
      sleep 1
      scrot -s "${FILE}"
      ;;
    *) ;;
  esac
}

screenshot $1
