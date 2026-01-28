


pkill swww 2>/dev/null
swww-daemon &
sleep 1

# Directories
WALL_DIR="$HOME/hyprlnd/wallpapers"
STYLE_TEMPLATE="$HOME/hyprlnd/waybar/style.css.template"
STYLE_OUTPUT="$HOME/hyprlnd/waybar/style.css"
PYWAL_CSS="$HOME/.cache/wal/colors-waybar.css"
KITTY_COLORS="$HOME/.cache/wal/colors-kitty.conf"

# Pick wallpaper using Wofi
CHOICE=$(ls "$WALL_DIR" | wofi --dmenu -p "Select Wallpaper:")
[ -z "$CHOICE" ] && exit 0
WALL="$WALL_DIR/$CHOICE"

# Apply wallpaper
swww img "$WALL" --transition-type outer --transition-duration 1

# Generate pywal colors for Waybar & Kitty automatically
$HOME/.local/bin/wal -i "$WALL" --backend kitty
sleep 1

# Update all open Kitty windows dynamically
kitty @ set-colors --all "$KITTY_COLORS" 2>/dev/null || echo "Kitty remote control not available, colors will apply on new windows"

# Make sure pywal16 CSS exists
if [ ! -f "$PYWAL_CSS" ]; then
    echo "Pywal16 CSS not found at: $PYWAL_CSS"
    exit 1
fi

# Build final Waybar stylesheet
# Replace @@COLORS@@ placeholder in template
# Build final Waybar stylesheet (no template needed)
echo "@import url('$PYWAL_CSS');" > "$STYLE_OUTPUT"
pkill -USR2 waybar



# Optional: create temporary Fastfetch config for dynamic ASCII logo
#!/bin/bash
# source your pywal colors

