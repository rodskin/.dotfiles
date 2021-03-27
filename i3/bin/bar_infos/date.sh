#!/bin/sh
mydate() {
  local bg=$bg_date
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_time\","
  echo -n "\"full_text\":\" $icon_date $(date "+%d/%m %H:%M") \","
  echo -n "\"color\":\"$color_date\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

mybirthday() {
    local bg=$bg_birthday
    today=$(date +'%Y-%m-%d')
    tomorrow=$(date +'%Y-%m-%d' -d "+2 days")
    birthday=`gcalcli agenda ${today} ${tomorrow} | grep 'Anniversaire'`
    bg_separator_previous=$bg
    full_text=""
    if [ ! -z "$birthday" ]; then
        full_text=" $icon_birthday "
    fi
    echo -n "{"
    echo -n "\"name\":\"id_birthday\","
    echo -n "\"full_text\":\"$full_text\","
    echo -n "\"color\":\"$color_birthday\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}

myagenda() {
    local bg=$bg_calendar
    local today=$(date +'%Y-%m-%dT%H:%M:%S')
    local tomorrow=$(date +'%Y-%m-%d' -d "+2 days")
    todo=`gcalcli --calendar=Rod agenda ${today} ${tomorrow} | grep 'No Events Found'`
    bg_separator_previous=$bg
    full_text=""
    if [ -z "$todo" ]; then
        full_text=" $icon_calendar "
    fi
    echo -n "{"
    echo -n "\"name\":\"id_agenda\","
    echo -n "\"full_text\":\"$full_text\","
    echo -n "\"color\":\"$color_calendar\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}
