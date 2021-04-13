#!/bin/sh
    today=$(date +'%Y-%m-%dT%H:%M:%S')
    #today=$(date +'%Y-%m-%d')
    echo $today
    tomorrow=$(date +'%Y-%m-%d' -d "+2 days")
    echo $tomorrow
    todo=`gcalcli --calendar=Rod agenda ${today} ${tomorrow}`
    todogrep=`echo ${todo} | grep 'No Events Found'`
    echo $todo
    full_text=""
    if [ -z "$todogrep" ]; then
        full_text="  "
        agenda_first=`echo ${todo} | awk '{ print gensub("[^0-9]*([0-9][0-9]*).*$","\\1","1") }'`
        echo $agenda_first
        echo '--'
        echo $agenda_first | grep "[a-z.]+"
        #echo $agenda_first | grep -e " [a-z.]+ [^(]" | sed -e "s/\([A-Z0-9:]\+\) .*/\1/"
    fi
    #echo -n "\"full_text\":\"$full_text\","
