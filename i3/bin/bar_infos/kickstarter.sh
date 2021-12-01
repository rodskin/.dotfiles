#!/bin/bash
mykickstarter() {
  local bg=$bg_inactive
  local icon=$icon_kickstarter
  local icon_color=$color_inactive
  f="${HOME}/.dotfiles/i3_infos/kickstarter_projects.csv"
  if [[ -s $f ]]; then
    bg=$bg_kickstarter
    icon_color=$color_kickstarter
  fi

  pwd=`pwd`
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
