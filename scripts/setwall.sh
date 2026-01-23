#!/bin/bash
# ============================================
# Hyprland + Wofi + Pywal16 Waybar Updater
# ============================================

# Kill and restart swww daemon
pkill swww 2>/dev/null
swww-daemon &
sleep 1

# Directories
WALL_DIR="$HOME/hyprlnd/wallpapers"
STYLE_TEMPLATE="$HOME/.config/waybar/style.css.template"
STYLE_OUTPUT="$HOME/.config/waybar/style.css"
PYWAL_CSS="$HOME/.cache/wal/colors-waybar.css"

# Pick wallpaper using Wofi
CHOICE=$(ls "$WALL_DIR" | wofi --dmenu -p "Select Wallpaper:")
[ -z "$CHOICE" ] && exit 0
WALL="$WALL_DIR/$CHOICE"

# Apply wallpaper
swww img "$WALL" --transition-type outer --transition-duration 1

# Generate pywal colors
wal -i "$WALL"
sleep 1

# Make sure pywal16 CSS exists
if [ ! -f "$PYWAL_CSS" ]; then
    echo "Pywal16 CSS not found at: $PYWAL_CSS"
    exit 1
fi

# Build final Waybar stylesheet
# Replace @@COLORS@@ placeholder in template
sed "s|@@COLORS@@|@import url(\"$PYWAL_CSS\");|" "$STYLE_TEMPLATE" > "$STYLE_OUTPUT"

"
