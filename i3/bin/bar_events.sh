#!/bin/sh

# click events
while read line;
do
  # echo $line > /home/you/gitclones/github/i3/tmp.txt
  # {"name":"id_vpn","button":1,"modifiers":["Mod2"],"x":2982,"y":9,"relative_x":67,"relative_y":9,"width":95,"height":22}

  # VPN click
  if [[ $line == *"name"*"id_vpn"* ]]; then
    alacritty -e /home/you/.config/i3status/click_vpn.sh &

  # CHECK UPDATES
  elif [[ $line == *"name"*"id_systemupdate"* ]]; then
    alacritty -e /home/you/.config/i3status/click_checkupdates.sh &

  # CPU
  elif [[ $line == *"name"*"id_cpu_usage"* ]]; then
    alacritty -e htop &

  # TIME
  elif [[ $line == *"name"*"id_time"* ]]; then
    alacritty -e /home/you/.config/i3status/click_time.sh &

  # METEO
  elif [[ $line == *"name"*"id_meteo"* ]]; then
    xdg-open https://openweathermap.org/city/2986140 > /dev/null &

  # CRYPTO
  elif [[ $line == *"name"*"id_crypto"* ]]; then
    xdg-open https://www.livecoinwatch.com/ > /dev/null &

  # VOLUME
  elif [[ $line == *"name"*"id_volume"* ]]; then
    alacritty -e alsamixer &

  # LOGOUT
  elif [[ $line == *"name"*"id_logout"* ]]; then
    i3-nagbar -t warning -m 'Log out ?' -b 'yes' 'i3-msg exit' > /dev/null &

  fi  
done