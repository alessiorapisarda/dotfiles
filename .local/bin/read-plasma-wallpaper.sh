#!/bin/bash

LOG="$HOME/.local/share/kde-material-you-colors/kde-material-you-colors.log"

WALL=$(tac "$LOG" | grep -m1 "Wallpaper:" | sed -E 's/.*\(image\): //')

if [[ -n "$WALL" && -f "$WALL" ]]; then
  noctalia theme "$WALL" -c ~/.config/matugen/config.toml
  echo "Applied $WALL"
else
  echo "Wallpaper not found in log or file missing" >&2
  exit 1
fi
