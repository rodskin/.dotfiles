#!/bin/sh

# i3 config in ~/.config/i3/config :
# bar {
#   status_command exec /home/you/.config/i3status/mybar.sh
# }

#source ~/.config/i3/bin/colors.sh
#source ~/.config/i3/bin/icons.sh

bg_bar_color="#000000"
bg_separator_previous="#000000"
bg_inactive="#424242"

bg_spotify="#1DB954"
color_spotify="#FFFFFF"
bg_docker="#0DB7ED"
color_docker="#FFFFFF"
bg_vpn="#E53935"
color_vpn="#FFFFFF"
bg_crypto="#990099"
color_crypto="#FFFFFF"
bg_ip_external="#FFD300"
color_ip_external="#000000"
bg_ip_internal="#2E7D32"
color_ip_internal="#FFFFFF"
bg_disc_cpu_memory="#3949AB"
color_disc_cpu_memory="#FFFFFF"
bg_meteo="#546E7A"
color_meteo="#FFFFFF"
bg_date="#E0E0E0"
color_date="#000000"
bg_battery="#D69E2E"
color_battery="#000000"
bg_volume="#673AB7"
color_volume="#FFFFFF"

# ICONS
icon_spotify=""
icon_docker=""
icon_vpn_off=""
icon_vpn_on=""
icon_crypto="₿"
icon_ip_external=""
icon_ip_internal=""
icon_disc=""
icon_memory=""
icon_cpu=""
icon_meteo=""
icon_date=""
icon_battery_100=""
icon_battery_75=""
icon_battery_50=""
icon_battery_25=""
icon_battery_0=""
icon_battery_charging=""
icon_volume_on=""
icon_volume_off=""


# Print a left caret separator
# @params {string} $1 text color, ex: "#FF0000"
# @params {string} $2 background color, ex: "#FF0000"
separator() {
  echo -n "{"
  echo -n "\"full_text\":\"\"," # CTRL+Ue0b2
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border\":\"$bg_bar_color\","
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"color\":\"$1\","
  echo -n "\"background\":\"$2\""
  echo -n "}"
}

common() {
  echo -n "\"border\": \"$bg_bar_color\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border_top\":2,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0"
}

first() {
  local bg=$bg_bar_color
  separator $bg $bg_bar_color
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"first\","
  echo -n "\"full_text\":\"\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myspotify() {
  local bg=$bg_spotify
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"spotify\","
  echo -n "\"full_text\":\" $icon_spotify $(~/.config/i3status/get_spotify) \","
  echo -n "\"color\":\"$color_spotify\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

mydocker() {
    local bg=$bg_inactive
    docker_count=`docker ps -q $1 | wc -l`
    if [ "$docker_count" -gt 0 ]; then
        bg=$bg_docker
    fi
    separator $bg $bg_separator_previous 
    bg_separator_previous=$bg
    echo -n ",{"
    echo -n "\"name\":\"id_docker\","      
    echo -n "\"full_text\":\" ${icon_docker} ${docker_count} \","
    echo -n "\"color\":\"$color_docker\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}

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
  echo -n ",{"
  echo -n "\"name\":\"id_vpn\","      
  echo -n "\"full_text\":\" ${icon} VPN \","
  echo -n "\"color\":\"$color_vpn\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

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

myip_public() {
  local bg=$bg_ip_external
  separator $bg $bg_separator_previous
  bg_separator_previous=$bg
  echo -n ",{"
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
  echo -n ",{"
  echo -n "\"name\":\"ip_local\","
  echo -n "\"full_text\":\" $icon_ip_internal $(ip route get 1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') \","
  echo -n "\"color\":\"$color_ip_internal\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

disk_usage() {
  local bg=$bg_disc_cpu_memory
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_disk_usage\","
  echo -n "\"full_text\":\" $icon_disc $(~/.config/i3status/disk.py)%\","
  echo -n "\"color\":\"$color_disc_cpu_memory\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "}"
}

memory() {
  local bg=$bg_disc_cpu_memory
  echo -n ",{"
  echo -n "\"name\":\"id_memory\","
  echo -n "\"full_text\":\" $icon_memory $(~/.config/i3status/memory.py)%\","
  echo -n "\"color\":\"$color_disc_cpu_memory\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "}"
}

cpu_usage() {
  local bg=$bg_disc_cpu_memory
  echo -n ",{"
  echo -n "\"name\":\"id_cpu_usage\","
  echo -n "\"full_text\":\" $icon_cpu $(~/.config/i3status/cpu.py)% \","
  echo -n "\"color\":\"$color_disc_cpu_memory\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

meteo() {
  local bg=$bg_meteo
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_meteo\","
  echo -n "\"full_text\":\" $icon_meteo $(~/.config/i3status/meteo.py) \","
  echo -n "\"color\":\"$color_meteo\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

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

battery0() {
  local bg=$bg_battery
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg

  if [ -f /sys/class/power_supply/BAT0/uevent ]; then
    prct=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)
    charging=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2) # POWER_SUPPLY_STATUS=Discharging|Charging
    icon=$icon_battery_100
    if [ "$prct" -le 5 ]
    then
        icon=$icon_battery_0
    elif [ \( "$prct" -gt 5 -a "$prct" -le 25 \) ];then
        icon=$icon_battery_25
    elif [ \( "$prct" -gt 25 -a "$prct" -le 50 \) ];then
        icon=$icon_battery_50
    elif [ \( "$prct" -gt 50 -a "$prct" -le 75 \) ];then
        icon=$icon_battery_75
    fi


    if [ "$charging" == "Charging" ]; then
      icon=$icon_battery_charging
    fi
    echo -n ",{"
    echo -n "\"name\":\"battery0\","
    echo -n "\"full_text\":\" ${icon} ${prct}% \","
    echo -n "\"color\":\"$color_battery\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
  fi
}

volume() {
  local bg=$bg_volume
  separator $bg $bg_separator_previous  
  vol=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')
  echo -n ",{"
  echo -n "\"name\":\"id_volume\","
  if [ $vol = "0%" ]; then
    echo -n "\"full_text\":\" $icon_volume_off ${vol} \","
  else
    echo -n "\"full_text\":\" $icon_volume_on ${vol} \","
  fi
  echo -n "\"color\":\"$color_volume\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "}"
  #separator $bg_bar_color $bg
}

systemupdate() {
  local nb=$(checkupdates | wc -l)
  if (( $nb > 0)); then
    echo -n ",{"
    echo -n "\"name\":\"id_systemupdate\","
    echo -n "\"full_text\":\"  ${nb}\""
    echo -n "}"
  fi
}

logout() {
  echo -n ",{"
  echo -n "\"name\":\"id_logout\","
  echo -n "\"full_text\":\"  \""
  echo -n "}"
}

# https://github.com/i3/i3/blob/next/contrib/trivial-bar-script.sh
echo '{ "version": 1, "click_events":true }'     # Send the header so that i3bar knows we want to use JSON:
echo '['                    # Begin the endless array.
echo '[]'                   # We send an empty first array of blocks to make the loop simpler:

# Now send blocks with information forever:
(while :;
do
	echo -n ",["
  first
  myspotify
  mydocker
  myvpn_on
  mycrypto
  myip_public
  myip_local
  disk_usage
  memory
  cpu_usage
  meteo
  mydate
  battery0
  volume
  systemupdate
  #logout
  echo "]"
	sleep 5 
done) &

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

