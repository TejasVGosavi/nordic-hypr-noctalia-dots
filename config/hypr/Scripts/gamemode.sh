#!/usr/bin/env bash
# =====================================================================
# ~ SCRIPT: ~/.config/hypr/Scripts/gamemode.sh (Radeon R3 Booster) ~
# =====================================================================

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" = 1 ]; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    notify-send "Performance Mode" "Enabled (Blur & Animations OFF)" -i input-gaming
    exit 0
else
    hyprctl reload
    notify-send "Performance Mode" "Disabled (Nordic Glass Restored)" -i preferences-desktop-theme
    exit 0
fi