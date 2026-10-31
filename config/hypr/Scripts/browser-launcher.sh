#!/usr/bin/env bash
# =====================================================================
# ~ SCRIPT: ~/.config/hypr/Scripts/browser-launcher.sh ~
# =====================================================================

BROWSERS=("firefox" "zen-browser" "brave" "chromium" "google-chrome-stable" "vivaldi")

for browser in "${BROWSERS[@]}"; do
    if command -v "$browser" >/dev/null 2>&1; then
        exec "$browser" "$@"
    fi
done

notify-send "Browser Launcher" "No supported browser found!" -u critical
exit 1