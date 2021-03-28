#!/bin/bash
myepic() {
  local bg=$bg_epic
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_epic\","
  echo -n "\"full_text\":\" $icon_epic $(~/.config/i3status/epic.py) \","
  echo -n "\"color\":\"$color_epic\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
