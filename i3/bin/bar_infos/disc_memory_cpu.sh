#!/bin/bash
disk_usage() {
  local bg=$bg_disc_cpu_memory
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_disk_usage\","
  echo -n "\"full_text\":\" $icon_disc $(~/.config/i3status/disk.py)%\","
  echo -n "\"color\":\"$color_disc_cpu_memory\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

memory() {
  local bg=$bg_disc_cpu_memory
  echo -n "{"
  echo -n "\"name\":\"id_memory\","
  echo -n "\"full_text\":\" $icon_memory $(~/.config/i3status/memory.py)%\","
  echo -n "\"color\":\"$color_disc_cpu_memory\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

cpu_usage() {
  local bg=$bg_disc_cpu_memory
  echo -n "{"
  echo -n "\"name\":\"id_cpu_usage\","
  echo -n "\"full_text\":\" $icon_cpu $(~/.config/i3status/cpu.py)% \","
  echo -n "\"color\":\"$color_disc_cpu_memory\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
