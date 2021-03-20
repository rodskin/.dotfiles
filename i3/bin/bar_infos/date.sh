#!/bin/sh
mydate() {
  local bg=$bg_date
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_time\","
  echo -n "\"full_text\":\" $icon_date $(date "+%d/%m %H:%M") \","
  echo -n "\"color\":\"$color_date\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
