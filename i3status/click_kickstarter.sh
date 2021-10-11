#!/bin/bash

f="${HOME}/.dotfiles/i3/bin/bar_infos/kickstarter_projects.txt"
if [[ -s "$f" ]]; then
    cat "$f"
fi
