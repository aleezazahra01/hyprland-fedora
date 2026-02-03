


pkill swww 2>/dev/null
swww-daemon &
sleep 1


WALL_DIR="$HOME/hyprlnd/wallpapers"
STYLE_TEMPLATE="$HOME/hyprlnd/waybar/style.css.template"
STYLE_OUTPUT="$HOME/hyprlnd/waybar/style.css"
PYWAL_CSS="$HOME/.cache/wal/colors-waybar.css"
KITTY_COLORS="$HOME/.cache/wal/colors-kitty.conf"

CHOICE=$(ls "$WALL_DIR" | wofi --dmenu -p "Select Wallpaper:")
[ -z "$CHOICE" ] && exit 0
WALL="$WALL_DIR/$CHOICE"


swww img "$WALL" --transition-type outer --transition-duration 1

#$HOME/.local/bin/wal -i "$WALL" --backend kitty
#$HOME/.local/bin/wal -i "$WALL" --backend waybar
$HOME/.local/bin/wal -i "$WALL"
pkill waybar
waybar &


sleep 1

kitty @ set-colors --all "$KITTY_COLORS" 2>/dev/null || echo "Kitty remote control not available, colors will apply on new windows"


if [ ! -f "$PYWAL_CSS" ]; then
    echo "Pywal16 CSS not found at: $PYWAL_CSS"
    exit 1
fi

    echo "Pywal16 CSS not found at: $PYWAL_CSS"
    exit 1
fi


