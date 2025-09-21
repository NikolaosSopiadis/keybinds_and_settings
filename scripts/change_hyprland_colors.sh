#!/usr/bin/env bash
set -euo pipefail

j="$HOME/.cache/wal/colors.json"
[ -f "$j" ] || exit 0

# read hex (strip leading '#')
gethex() { jq -r ".colors.$1" "$j" | sed 's/^#//'; }

C4="$(gethex color4)"
C5="$(gethex color5)"
C8="$(gethex color8)"
C0="$(gethex color0)"

# sanity: bail if any are empty
if [[ -z "$C4" || -z "$C5" || -z "$C8" || -z "$C0" ]]; then
  echo "pywal colors missing (did wal run?)." >&2
  exit 1
fi

# Build valid Hyprland color strings
# Option A: gradient active, solid inactive
printf -v ACTIVE   'rgba(%see) rgba(%see) 45deg' "$C4" "$C5"
printf -v INACTIVE 'rgba(%saa)' "$C8"

# Apply in one batch
hyprctl --batch "keyword general:col.active_border $ACTIVE; keyword general:col.inactive_border $INACTIVE"
