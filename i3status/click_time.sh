#!/bin/sh

# show year calendar with week numbers
# and press any key to exit
gcal -K --starting-day=Monday --with-week-number .+
gcalcli agenda `date +'%Y-%m-%d'` `date +'%Y-%m-%d' -d "+15 days"`
