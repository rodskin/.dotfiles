#!/bin/sh
myspotify() {
    local bg=$bg_inactive
    spotify_string=$(~/.config/i3status/get_spotify)
    if [ ! -z "$spotify_string" ]; then
        bg=$bg_spotify
    fi
    separator $bg $bg_separator_previous
    bg_separator_previous=$bg
    echo -n "{"
    echo -n "\"name\":\"spotify\","
    echo -n "\"full_text\":\" $icon_spotify $spotify_string \","
    echo -n "\"color\":\"$color_spotify\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}
