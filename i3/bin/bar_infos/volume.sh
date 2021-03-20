#!/bin/bash
volume() {
  local bg=$bg_volume
  separator $bg $bg_separator_previous
  state=$(amixer -D pulse get Master | egrep 'Left: Playback.*?\[o' | egrep -o '\[o.+\]')
  vol=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')
  echo -n ",{"
  echo -n "\"name\":\"id_volume\","
  if [ $state = "[off]" ]; then
    echo -n "\"full_text\":\" $icon_volume_mute - \","
  else
    if [ $vol = "0%" ]; then
        echo -n "\"full_text\":\" $icon_volume_off ${vol} \","
    else
        echo -n "\"full_text\":\" $icon_volume_on ${vol} \","
    fi
  fi
  echo -n "\"color\":\"$color_volume\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "}"
  #separator $bg_bar_color $bg
}
