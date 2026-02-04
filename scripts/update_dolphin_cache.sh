#!/usr/bin/env bash
set -euo pipefail

echo "==> Refreshing KDE (Dolphin) service cache..."

# Ensure KDE can find an XDG menu file in non-Plasma sessions
if [[ -e /etc/xdg/menus/plasma-applications.menu && ! -e /etc/xdg/menus/applications.menu ]]; then
  echo "==> Missing /etc/xdg/menus/applications.menu"
  echo "    Creating symlink to plasma-applications.menu (requires sudo)..."
  sudo ln -sf /etc/xdg/menus/plasma-applications.menu /etc/xdg/menus/applications.menu
fi

# Kill Dolphin if it's running (so it won't hold stale state)
if pgrep -x dolphin >/dev/null 2>&1; then
  echo "==> Closing Dolphin..."
  pkill -x dolphin || true
fi

# Remove KDE cache so we don't keep stale/incremental junk
echo "==> Removing old ksycoca cache..."
rm -f ~/.cache/ksycoca6_* 2>/dev/null || true

# Full rebuild
echo "==> Rebuilding ksycoca (full)..."
kbuildsycoca6 --noincremental

# Refresh desktop MIME caches (helps 'Open With' candidates)
if command -v update-desktop-database >/dev/null 2>&1; then
  echo "==> Updating desktop database (user)..."
  update-desktop-database ~/.local/share/applications 2>/dev/null || true

  echo "==> Updating desktop database (system) (requires sudo)..."
  sudo update-desktop-database /usr/share/applications 2>/dev/null || true
fi

echo "==> Done."
