#!/usr/bin/env bash
# =====================================================================
# ~ SCRIPT: ~/.config/hypr/Scripts/backup-dots.sh ~
# Syncs Hyprland 0.56, Noctalia v5, Kitty, Neovim, GTK3 & Starship to Git
# =====================================================================

set -euo pipefail

DOTS_DIR="$HOME/dotfiles"
CONFIG_SRC="$HOME/.config"
CONFIG_DST="$DOTS_DIR/config"
STATE_TOML="$HOME/.local/state/noctalia/settings.toml"
NOCTALIA_TOML="$CONFIG_SRC/noctalia/config.toml"
GREETER_TOML="/var/lib/noctalia-greeter/greeter.toml"

# Ensure target directories exist
mkdir -p "$CONFIG_DST" "$DOTS_DIR/system/noctalia-greeter"

echo "==> [1/4] Syncing latest Noctalia v5 runtime state..."
if [[ -f "$STATE_TOML" ]]; then
    cp "$STATE_TOML" "$NOCTALIA_TOML"
    # Redact Wallhaven API key if one is ever added in the future
    sed -i 's/^api_key = ".*"/api_key = ""/' "$NOCTALIA_TOML"
fi

echo "==> [2/4] Mirroring configs to $DOTS_DIR..."
# Sync folders cleanly with rsync (deletes removed files in destination)
for dir in hypr noctalia kitty nvim gtk-3.0; do
    if [[ -d "$CONFIG_SRC/$dir" ]]; then
        mkdir -p "$CONFIG_DST/$dir"
        rsync -a --delete "$CONFIG_SRC/$dir/" "$CONFIG_DST/$dir/"
    fi
done

# Sync standalone starship.toml
if [[ -f "$CONFIG_SRC/starship.toml" ]]; then
    cp "$CONFIG_SRC/starship.toml" "$CONFIG_DST/starship.toml"
fi

# Sync system Noctalia Greeter config if readable
if [[ -r "$GREETER_TOML" ]]; then
    cp "$GREETER_TOML" "$DOTS_DIR/system/noctalia-greeter/greeter.toml"
fi

echo "==> [3/4] Checking Git status in $DOTS_DIR..."
cd "$DOTS_DIR"

if [[ ! -d ".git" ]]; then
    echo "Error: $DOTS_DIR is not a Git repository yet. Run the one-time setup below first."
    exit 1
fi

git add -A

if git diff --cached --quiet; then
    echo "✓ No changes detected. Dotfiles are already up to date!"
    notify-send "Dotfiles Backup" "No new changes to commit." -i vcs-normal
    exit 0
fi

# Use custom commit message if passed as argument, otherwise use timestamp
COMMIT_MSG="${1:-"chore(dots): sync CachyOS Hyprland v0.56.2 & Noctalia v5 ($(date +'%Y-%m-%d %H:%M'))"}"
git commit -m "$COMMIT_MSG"

echo "==> [4/4] Pushing to GitHub..."
if git remote | grep -q "^origin$"; then
    git push -u origin main
    echo "✓ Successfully pushed dotfiles to GitHub!"
    notify-send "Dotfiles Backup" "Pushed latest configs to GitHub!" -i emblem-synchronized
else
    echo "✓ Committed locally! (Add a 'origin' remote to push to GitHub)."
fi