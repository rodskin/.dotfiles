#!/bin/sh

# https://github.com/i3/i3/blob/next/contrib/trivial-bar-script.sh
echo '{ "version": 1, "click_events":true }'     # Send the header so that i3bar knows we want to use JSON:
echo '['                    # Begin the endless array.
echo '[]'                   # We send an empty first array of blocks to make the loop simpler:

(while :;
do
	echo -n ",["
    first
    myspotify
    myvpn_on
    myvmy_on
    myip_public
    myip_local
    pre_disk_cpu_mem
    #disk_usage
    memory
    cpu_usage
    mydate
    myagenda
    mybirthday
    volume
    last
    echo "]"
	sleep 5 
done) &
