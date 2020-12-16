#!/bin/sh
# Send the header so that i3bar knows we want to use JSON:

echo '{ "version": 1, "click_events":true }'
echo '['
echo '[]'

# lancé dans un processus en arrière plan
(while :;
do
  echo ",[{\"name\":\"id_time\",\"full_text\":\" $(date)\"}]"
  sleep 5
done) &

# Ecoute des évènement en STDIN
while read line;
do
  # echo $line > /tmp/tmp.txt
  # on reçoit en STDIN :
  # {"name":"id_time","button":1,"modifiers":["Mod2"],"x":2982,"y":9,"relative_x":67,"relative_y":9,"width":95,"height":22}

  # DATE click
  #if [[ $line == *"name"*"id_time"* ]]; then
  #  zsh -e ~/.dotfiles/i3status/click_time.sh &
  #fi  
done

