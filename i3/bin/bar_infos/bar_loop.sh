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
    mydocker
    myvpn_on
    myvmy_on
    mycrypto
    myip_public
    myip_local
    disk_usage
    memory
    cpu_usage
    meteo
    mydate
    battery0
    systemupdate
    volume
   #logout
   last
    echo "]"
	sleep 5 
done) &
