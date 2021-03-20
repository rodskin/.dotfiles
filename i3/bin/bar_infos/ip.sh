#!/bin/sh
myip_public() {
  local bg=$bg_ip_external
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"ip_public\","
  echo -n "\"full_text\":\" $icon_ip_external $(dig +short myip.opendns.com @208.67.220.220) \","
  echo -n "\"color\":\"$color_ip_external\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myip_local() {
  local bg=$bg_ip_internal
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"ip_local\","
  echo -n "\"full_text\":\" $icon_ip_internal $(ip route get 1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') \","
  echo -n "\"color\":\"$color_ip_internal\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
