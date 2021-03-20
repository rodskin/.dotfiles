#!/bin/bash
volume() {
  local bg=$bg_volume
  local full_text=''
  state=$(amixer -D pulse get Master | egrep 'Left: Playback.*?\[o' | egrep -o '\[o.+\]')
  vol=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')
  if [ $state = "[off]" ]; then
    bg=$bg_inactive
    full_text="${icon_volume_mute} -"
  else
    if [ $vol = "0%" ]; then
        full_text="${icon_volume_off} ${vol}"
    else
        full_text="${icon_volume_on} ${vol}"
    fi
  fi
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_volume\","
  echo -n "\"full_text\":\" ${full_text} \","
  echo -n "\"color\":\"$color_volume\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
