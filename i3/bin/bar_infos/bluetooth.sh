#!/bin/bash
bluetooth() {
    local bg=$bg_bluetooth

    bluetooth_status=`hciconfig | grep 'DOWN'`
    if [ $bluetooth_status = 'DOWN' ]; then
        bg=$bg_inactive
    fi

    separator $bg $bg_separator_previous
    bg_separator_previous=$bg

    echo -n "{"
    echo -n "\"name\":\"id_bluetooth\","
    echo -n "\"full_text\":\" ${icon_bluetooth} \","
    echo -n "\"color\":\"$color_bluetooth\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}
