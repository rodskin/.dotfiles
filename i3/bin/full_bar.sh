#!/bin/bash

# i3 config in ~/.config/i3/config :
# bar {
#   status_command exec /home/you/.config/i3status/mybar.sh
# }

source ~/.config/i3/bin/bar_infos/bar_colors.sh
source ~/.config/i3/bin/bar_infos/bar_icons.sh

source ~/.config/i3/bin/bar_infos/common.sh
source ~/.config/i3/bin/bar_infos/epic.sh
source ~/.config/i3/bin/bar_infos/battery.sh
source ~/.config/i3/bin/bar_infos/crypto.sh
source ~/.config/i3/bin/bar_infos/spotify.sh
source ~/.config/i3/bin/bar_infos/vpn.sh
source ~/.config/i3/bin/bar_infos/ip.sh
source ~/.config/i3/bin/bar_infos/disc_memory_cpu.sh
source ~/.config/i3/bin/bar_infos/docker.sh
source ~/.config/i3/bin/bar_infos/meteo.sh
source ~/.config/i3/bin/bar_infos/date.sh
source ~/.config/i3/bin/bar_infos/bluetooth.sh
source ~/.config/i3/bin/bar_infos/volume.sh
source ~/.config/i3/bin/bar_infos/systemupdate.sh
source ~/.config/i3/bin/bar_infos/logout.sh
source ~/.config/i3/bin/bar_infos/smoking.sh

# Now send blocks with information forever:
source ~/.config/i3/bin/bar_infos/bar_loop.sh

source ~/.config/i3/bin/bar_infos/bar_events.sh
