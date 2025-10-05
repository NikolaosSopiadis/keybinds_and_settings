#!/usr/bin/env bash
set -euo pipefail

# Usage: wallpaper-rotator.sh [interval_seconds]
INTERVAL="${1:-600}" # given by the first argument, otherwise default to 600
WALL_DIR="${WALL_DIR:-$HOME/Pictures/Wallpapers}"   # override with env if you want
LOCK_FILE="$XDG_RUNTIME_DIR/hypr-wallpaper-rotator.lock"

# Run only under Hyprland (by checking env variables)
if [[ -z "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]] && [[ "${XDG_CURRENT_DESKTOP:-}" != "Hyprland" ]]; then
    echo "Run only under Hyprland"
    exit 0
fi

# Single instance guard (per session) using fd 9
exec 9>"$LOCK_FILE"
if ! flock -n 9; then
    # already running for this Hyprland session
    echo "Already running for this Hyprland session"
    exit 0
fi

# Loop while Hyprland is alive (hyprctl works)
while hyprctl -j monitors >/dev/null 2>&1; do

    "$HOME/scripts/change_wallpaper.sh"

    # if multiple instances of waybar running sumultaneously, then kill them all and keep a single one
    COUNT="$(pgrep -x waybar | wc -l || true)"
    if (( COUNT > 1 )); then
        echo "Killing waybar"
        killall waybar
        sleep 0.2
        waybar
    fi
    
    sleep "$INTERVAL" || break
done
