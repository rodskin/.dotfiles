#!/bin/sh
systemupdate() {
  local bg=$bg_systemupdate_good
  local color=$color_systemupdate_good
  local nb=$(sudo apt-get upgrade --dry-run | grep 'Inst' | wc -l)
  #local nb=1
  if [ $nb -gt 0 ]; then
    bg=$bg_systemupdate_bad
    color=$color_systemupdate_bad
  fi
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_systemupdate\","
  echo -n "\"full_text\":\" ${icon_systemupdate} ${nb} \","
  echo -n "\"color\":\" $color \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
