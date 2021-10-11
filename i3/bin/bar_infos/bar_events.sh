#!/bin/bash

# click events
while read line;
do
  # echo $line > /home/you/gitclones/github/i3/tmp.txt
  # {"name":"id_vpn","button":1,"modifiers":["Mod2"],"x":2982,"y":9,"relative_x":67,"relative_y":9,"width":95,"height":22}

  # VPN click
    if [[ $line == *"name"*"id_dbpn"* ]]; then
    alacritty -e ~/.config/i3status/click_dbpn.sh &

  #elif [[ $line == *"name"*"id_vmy"* ]]; then
    #alacritty -e ~/.config/i3status/click_vmy.sh &

    elif [[ $line == *"name"*"id_docker"* ]]; then
        alacritty --hold -e ~/.config/i3status/click_docker.sh &

    elif [[ $line == *"name"*"ip_public"* ]]; then
        alacritty --hold -e ~/.config/i3status/click_ip.sh &

    elif [[ $line == *"name"*"ip_local"* ]]; then
        alacritty --hold -e ~/.config/i3status/click_ip.sh &
  
  # EPIC
    elif [[ $line == *"name"*"id_epic"* ]]; then
        xdg-open https://www.epicgames.com/store/fr/free-games > /dev/null &

  # KICKSTARTER
    elif [[ $line == *"name"*"id_kickstarter"* ]]; then
        f="${HOME}/.dotfiles/i3/bin/bar_infos/kickstarter_projects.txt"
        if [[ -s $f ]]; then
            alacritty --hold -e ~/.config/i3status/click_kickstarter.sh &
        fi

  # CPU
    elif [[ $line == *"name"*"id_disk_mem_cpu"* ]]; then
        alacritty -e htop &

  # TIME
    elif [[ $line == *"name"*"id_time"* ]]; then
        alacritty --hold -e ~/.config/i3status/click_time.sh &
        
  # BLUETOOTH
    elif [[ $line == *"name"*"id_bluetooth"* ]]; then
        alacritty -e bluetoothctl &

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
