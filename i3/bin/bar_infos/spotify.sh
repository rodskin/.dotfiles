#!/bin/sh
myspotify() {
    local bg=$bg_spotify
    separator $bg $bg_separator_previous
    bg_separator_previous=$bg
    echo -n "{"
    echo -n "\"name\":\"spotify\","
    echo -n "\"full_text\":\" $icon_spotify $(~/.config/i3status/get_spotify) \","
    echo -n "\"color\":\"$color_spotify\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}
