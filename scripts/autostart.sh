#!/bin/bash

# Export Pywal GTK colors if they exist
[ -f ~/.cache/wal/colors.sh ] && source ~/.cache/wal/colors.sh

# Use your Hyprland folder as config home
export XDG_CONFIG_HOME="$HOME/hyprlnd"
a
# Set wallpaper & generate Pywal colors
"$HOME/hyprlnd/scripts/wallcycle.sh"
"$HOME/hyprlnd/scripts/wofi-way.sh"



# Start Waybar AFTER CSS exists
waybar --config "$HOME/hyprlnd/waybar/config" \
    --style "$HOME/hyprlnd/waybar/style.css" &

# Start Kitty
kitty &
waybar &

# Start swaync
#swaync --config "$HOME/hyprlnd/swaync/config.json" &

# Start fastfetch
fastfetch --config "$HOME/hyprlnd/fastfetch/config.jsonc" &

# Start Cava
"$HOME/hyprlnd/scripts/cava_pywal.sh" &
