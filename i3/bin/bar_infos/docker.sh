#!/bin/bash
mydocker() {
    local bg=$bg_inactive
    docker_count=`docker ps -q $1 | wc -l`
    if [ "$docker_count" -gt 0 ]; then
        bg=$bg_docker
    fi
    separator $bg $bg_separator_previous 
    bg_separator_previous=$bg
    echo -n "{"
    echo -n "\"name\":\"id_docker\","      
    echo -n "\"full_text\":\" ${icon_docker} ${docker_count} \","
    echo -n "\"color\":\"$color_docker\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
}
