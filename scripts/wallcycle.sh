#!/bin/bash

WALL_DIR="$HOME/hyprlnd/wallpapers"
WALLS=("$WALL_DIR"/*)

RANDOM_WALL="${WALLS[RANDOM % ${#WALLS[@]}]}"

# Call setwall instead of redoing logic
"$HOME/hyprlnd/scripts/setwall.sh" "$RANDOM_WALL"
