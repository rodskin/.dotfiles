#!/bin/bash
meteo() {
  local bg=$bg_meteo
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_meteo\","
  echo -n "\"full_text\":\" $icon_meteo $(~/.config/i3status/meteo.py) \","
  echo -n "\"color\":\"$color_meteo\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
