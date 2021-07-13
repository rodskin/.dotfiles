#!/bin/sh
mysmoking() {
    local bg=$bg_smoking
    separator $bg $bg_separator_previous
    bg_separator_previous=$bg
    echo -n "{"
    echo -n "\"name\":\"smoking\","
    echo -n "\"full_text\":\" $icon_smoking $(~/.config/i3status/get_smoking) \","
    echo -n "\"color\":\"$color_smoking\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}
