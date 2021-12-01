#!/bin/bash

f="${HOME}/.dotfiles/i3_infos/kickstarter_projects.csv"
if [[ -s "$f" ]]; then
    cat "$f" | column -t -s, | less -S
fi
