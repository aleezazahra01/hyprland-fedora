#!/usr/bin/env bash

# Load pywal colors
source "$HOME/.cache/wal/colors.sh"

CONFIG="$HOME/hyprlnd/cava/config"

cat > "$CONFIG" <<EOF
[general]
framerate = 60
bars = 50
autosens = 1

[input]
method = pulse
source = auto

[output]
method = ncurses
channels = stereo

[colors]
background = $color0
foreground = $color7
gradient = 1
gradient_color_1 = $color1
gradient_color_2 = $color2
gradient_color_3 = $color3
gradient_color_4 = $color4
gradient_color_5 = $color5
gradient_color_6 = $color6
EOF

pkill cava
cava -p "$CONFIG" &
