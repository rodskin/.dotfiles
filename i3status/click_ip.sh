#!/bin/sh
{ echo "# Private"; ALLIPS="$([ -x /bin/ip ] && ip a || /sbin/ifconfig -a)"; echo "$ALLIPS" | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | sed 's/\/[0-9]*//g' | sort | uniq; echo; echo "# Public"; dig +short myip.opendns.com @208.67.220.220; }
