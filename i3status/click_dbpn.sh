#!/bin/sh
vpn_status=`sudo wg`
if [ ! -z "$vpn_status" ]; then
    sudo wg-quick down ~/vpn/dbpn.conf
else
    sudo wg-quick up ~/vpn/dbpn.conf
fi
