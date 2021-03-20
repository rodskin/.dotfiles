#!/bin/bash
mycrypto() {
  local bg=$bg_crypto
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_crypto\","
  echo -n "\"full_text\":\" $icon_crypto $(~/.config/i3status/crypto.py) \","
  echo -n "\"color\":\"$color_crypto\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}
