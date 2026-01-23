#!/bin/bash

# -------------------------------
# Check Pywal colors
# -------------------------------
if [ ! -f ~/.cache/wal/colors.sh ]; then
    echo "Pywal colors not found! Run 'wal -i <image>' first."
    exit 1
fi

# Load Pywal colors
source ~/.cache/wal/colors.sh

# -------------------------------
# Paths
# -------------------------------
WAYBAR_OUT="$HOME/hyprlnd/waybar/style.css"
WOFI_OUT="$HOME/hyprlnd/wofi/colors-wofi.css"

mkdir -p "$(dirname "$WAYBAR_OUT")"
mkdir -p "$(dirname "$WOFI_OUT")"

# -------------------------------
# 1. Generate Waybar CSS
# -------------------------------
cat > "$WAYBAR_OUT" <<EOF


/* General font & color */
* {
    font-family: "JetBrainsMono Nerd Font";
    font-size: 20px;
    color: $foreground;
}

/* Waybar background */
#waybar {
    background: $background;
}
#waybar.hidden {
    opacity: 0.2;
}

/* Clock */
#clock {
    font-weight: bold;
    color: $color3;
    padding: 10px;
}

/* Custom Workspaces */
#custom-workspaces {
    padding: 4px 6px;
}

/* Workspace buttons as circles */
#custom-workspaces button {
    min-width: 24px;
    min-height: 24px;
    border-radius: 50%;        /* circle shape */
    margin: 0 4px;
    background-color: $color0; /* inactive workspace */
    color: $color7;            /* number color */
    border: 2px solid $color5;
}

/* Active workspace */
#custom-workspaces button.focused {
    background-color: $color4; /* active workspace color */
    color: $color0;            /* active number color */
}

/* Pulseaudio */
#pulseaudio {
    color: $color1;
    margin: 0 8px;
}

/* Battery */
#battery {
    color: $color3;
    margin: 0 8px;
}

/* Network */
#network {
    color: $color2;
    margin: 0 8px;
}

/* Tray */
#tray .tray {
    background: transparent;
    margin: 0 0 8px;
}
EOF

# -------------------------------
# 2. Generate Wofi CSS
# -------------------------------
cat > "$WOFI_OUT" <<EOF
/* Wofi colors generated from Pywal */
:root {
    --color0:  $color0;
    --color1:  $color1;
    --color2:  $color2;
    --color3:  $color3;
    --color4:  $color4;
    --color5:  $color5;
    --color6:  $color6;
    --color7:  $color7;
    --color8:  $color8;
    --color9:  $color9;
    --color10: $color10;
    --color11: $color11;
    --color12: $color12;
    --color13: $color13;
    --color14: $color14;
    --color15: $color15;
    --background: $background;
    --foreground: $foreground;
    --cursor: $cursor;
}

EOF

# -------------------------------
# 3. Reload Waybar
# -------------------------------
pkill -USR1 waybar

echo " Waybar and Wofi colors updated from Pywal!"
