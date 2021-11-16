#!/bin/bash

game_name=`python3 ~/.config/i3status/epic.py`
game_url=`python3 ~/.config/i3status/epic_url.py`


if [ -n "$game_url" ]; then
    echo $game_name >> ~/.dotfiles/i3_infos/epic_list.txt
    xdg-open "https://www.epicgames.com/store/en-US/p/$game_url" > /dev/null
fi
