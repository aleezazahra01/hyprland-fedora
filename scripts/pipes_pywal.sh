#!/bin/bash

# Load pywal colors
if [ -f ~/.cache/wal/colors.sh ]; then
    source ~/.cache/wal/colors.sh
else
    echo "Pywal colors not found!"
    exit 1
fi

# Build color string for pipes.sh
COLOR_STR="$color1,$color2,$color3,$color4,$color5,$color6"

# Run pipes.sh with pywal colors
# Make sure the pipes.sh script is executable and in scripts folder
~/hyprlnd/hypr/scripts/pipes.sh -c "$COLOR_STR"
