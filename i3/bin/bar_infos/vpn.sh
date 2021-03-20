#!/bin/sh
myvpn_on() {
  local bg=$bg_inactive
  local icon=$icon_vpn_off
  vpn_status=`sudo wg`
  if [ ! -z "$vpn_status" ]; then
    bg=$bg_vpn
    icon=$icon_vpn_on
  fi

  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_vpn\","      
  echo -n "\"full_text\":\" ${icon} DBPN \","
  echo -n "\"color\":\"$color_vpn\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myvmy_on() {
  local bg=$bg_inactive
  local icon=$icon_vpn_off
  vpn_status=`ip a | grep 'tun0'`
  if [ ! -z "$vpn_status" ]; then
    bg=$bg_vpn
    icon=$icon_vpn_on
  fi

  #separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_vmy\","      
  echo -n "\"full_text\":\" ${icon} VMY \","
  echo -n "\"color\":\"$color_vpn\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
