#!/usr/bin/env bash
notify-send "Called and finding winid"
out=$(hyprctl activewindow 2>/dev/null)
winid=$(printf "%s" "$out" | sed -n 's/^Window \([0-9a-fA-F]\+\).*/\1/p')
notify-send "The owinid is ${winid} "
if [ -z "$winid" ]; then
  echo "no active window id" >&2
  exit 1
fi

# check current pinned/sticky state (pinned field = 1 means sticky)
pinned=$(printf "%s" "$out" | sed -n 's/^\t*pinned: \([01]\\).*/\1/p')
if [ "$pinned" = "1" ]; then
  hyprctl setprop "$winid" sticky off
else
  hyprctl setprop "$winid" sticky on
fi

