#!/bin/sh
bluetooth_status=`hciconfig | grep 'DOWN'`

echo $bluetooth_status
