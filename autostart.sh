#!/bin/bash

[ -f ~/.cache/wal/colors.sh ] && source ~/.cache/wal/colors.sh

export XDG_CONFIG_HOME="$HOME/hyprlnd"
a
"$HOME/hyprlnd/scripts/wallcycle.sh"
"$HOME/hyprlnd/scripts/wofi-way.sh"



waybar --config "$HOME/hyprlnd/waybar/config" \
    --style "$HOME/hyprlnd/waybar/style.css" &


kitty &
waybar &
fastfetch --config "$HOME/hyprlnd/fastfetch/config.jsonc" &
"$HOME/hyprlnd/scripts/cava_pywal.sh" &
