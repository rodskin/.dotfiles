#!/bin/bash
pre_updates() {
  local bg=$bg_systemupdate_good
  local color=$color_systemupdate_good
  local package_updates=$(sudo apt-get upgrade --dry-run | grep 'Inst' | wc -l)
  local ubuntu_upgrade=$(sudo do-release-upgrade -c | grep 'New release' | wc -l)
  #package_updates=1
  if [[ $package_updates -gt 0 || $ubuntu_upgrade -gt 0 ]]; then
    bg=$bg_systemupdate_bad
    color=$color_systemupdate_bad
  fi
  separator $bg $bg_separator_previous # background left previous block
  bg_separator_previous=$bg
  echo -n "{"
  echo -n "\"name\":\"id_pre_updates\","
  echo -n "\"full_text\":\" $icon_systemupdate \","
  echo -n "\"color\":\"$color\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

systemupdate() {
  local bg=$bg_systemupdate_good
  local color=$color_systemupdate_good
  local nb=$(sudo apt-get upgrade --dry-run | grep 'Inst' | wc -l)
  #local nb=1
  if [ $nb -gt 0 ]; then
    bg=$bg_systemupdate_bad
    color=$color_systemupdate_bad
    echo -n "{"
    echo -n "\"name\":\"id_systemupdate\","
    echo -n "\"full_text\":\" ${icon_packageupdate} ${nb} \","
    echo -n "\"color\":\"$color\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
  fi
}

systemupgrade() {
  local bg=$bg_systemupdate_good
  local color=$color_systemupdate_good
  local nb=$(sudo do-release-upgrade -c | grep 'New release' | wc -l)
  #local nb=1
  if [ $nb -gt 0 ]; then
    bg=$bg_systemupdate_bad
    color=$color_systemupdate_bad
    echo -n "{"
    echo -n "\"name\":\"id_systemupdate\","
    echo -n "\"full_text\":\" ${icon_distupdate} ${nb} \","
    echo -n "\"color\":\"$color\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
  fi
}
