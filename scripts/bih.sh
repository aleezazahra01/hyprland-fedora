#!/bin/bash

# Path to Pywal generated Sway colors
SWAY_COLORS="$HOME/.cache/wal/colors-sway.css"

# Loop forever watching the file
while inotifywait -e close_write "$SWAY_COLORS"; do
    echo "Detected Pywal colors change, regenerating CSS..."
    ~/hyprlnd/generate_colors.sh
done
