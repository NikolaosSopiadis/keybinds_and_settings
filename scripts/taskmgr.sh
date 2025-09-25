#!/usr/bin/env bash
set -euo pipefail

TITLE="task manager"
TERMINAL="${TERMINAL:-kitty}"   

# If task manager is running, just exit
if pgrep -af "$TITLE" >/dev/null 2>&1; then
    exit 0
fi

kitty --title "$TITLE" -- btop &

exit 0
