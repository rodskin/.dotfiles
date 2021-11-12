#!/bin/bash

f="${HOME}/.dotfiles/i3_infos/kickstarter_projects.txt"
if [[ -s "$f" ]]; then
    cat "$f"
fi
