#!/bin/sh
mykickstarter() {
  local bg=$bg_inactive
  local icon=$icon_kickstarter
  local icon_color=$color_inactive
  kickstarter=''
  if [ ! -z "$kickstarter" ]; then
    bg=$bg_kickstarter
    icon_color=$color_kickstarter
  fi

  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_kickstarter\","      
  echo -n "\"full_text\":\" ${icon} \","
  echo -n "\"color\":\"$icon_color\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
