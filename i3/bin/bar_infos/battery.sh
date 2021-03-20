#!/bin/bash
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
