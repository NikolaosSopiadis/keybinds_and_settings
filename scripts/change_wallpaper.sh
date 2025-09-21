#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

# Change color scheme with pywal
wal -i "$WALLPAPER" --cols16 lighten --saturate 0.20

## Change hyprland colors ##
"$HOME/scripts/change_hyprland_colors.sh"