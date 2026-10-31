#!/usr/bin/env bash
# =====================================================================
# ~ INSTALLER: Nordic minimaLinux x Caelestia Dotfiles ~
# Target: Arch Linux / CachyOS | Hyprland v0.56+ (Lua) & Noctalia v5
# =====================================================================

set -euo pipefail

# Nordic ANSI Colors
NORD_CYAN="\033[38;2;136;192;208m"
NORD_BLUE="\033[38;2;129;161;193m"
NORD_GREEN="\033[38;2;163;190;140m"
NORD_YELLOW="\033[38;2;235;203;139m"
NORD_RED="\033[38;2;191;97;106m"
RESET="\033[0m"
BOLD="\033[1m"

info()    { echo -e "${NORD_CYAN}${BOLD}==>${RESET} $1"; }
success() { echo -e "${NORD_GREEN}${BOLD}  ✓${RESET} $1"; }
warn()    { echo -e "${NORD_YELLOW}${BOLD}  !${RESET} $1"; }
error()   { echo -e "${NORD_RED}${BOLD}  ✗${RESET} $1"; }

if [[ $EUID -eq 0 ]]; then
    error "Please do not run this script as root. It will prompt for sudo when needed."
    exit 1
fi

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config-backup-$(date +'%Y%m%d-%H%M%S')"

clear
echo -e "${NORD_CYAN}${BOLD}"
cat << "EOF"
   _  __ordic      __  ____       _               __    _               
  / |/ /___  _____/ /_/  _/____  (_)___ ___  ____/ /   (_)___  __  ___  __
 /    // _ \/ ___/ __// / / __ \/ / __ `__ \/ __  /   / / __ \/ / / / |/_/
/_/|_/ \___/_/   \__/___//_/ /_/_/_/ /_/ /_/\__,_/   /_/_/ /_/\__,_/>  <  
                   Hyprland v0.56 (Lua) × Noctalia Shell v5 (TOML)
EOF
echo -e "${RESET}"

# ---------------------------------------------------------------------
# 1. INSTALL CORE & PLUGIN DEPENDENCIES
# ---------------------------------------------------------------------
info "[1/6] Installing official repository packages..."

PACMAN_PKGS=(
    hyprland
    hypridle
    kitty
    neovim
    thunar
    starship
    fish
    wl-clipboard
    cliphist
    brightnessctl
    playerctl
    pacman-contrib
    evtest
    acl
    zenity
    openssl
    jq
    socat
    mpv
    sqlite
    rsync
    git
    ttf-jetbrains-mono-nerd
    qt6ct
    nwg-look
)

sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}" || warn "Some optional pacman packages were skipped."
success "Core packages installed."

# Check for AUR helper (paru or yay) for Noctalia, mpvpaper & Nordzy theme
AUR_HELPER=""
if command -v paru >/dev/null 2>&1; then
    AUR_HELPER="paru"
elif command -v yay >/dev/null 2>&1; then
    AUR_HELPER="yay"
fi

if [[ -n "$AUR_HELPER" ]]; then
    info "[2/6] Installing AUR packages via $AUR_HELPER (Noctalia, mpvpaper, Nordzy)..."
    $AUR_HELPER -S --needed --noconfirm noctalia-shell mpvpaper nordzy-cursors || warn "Some AUR packages were skipped or already installed."
    success "AUR packages processed."
else
    warn "[2/6] No AUR helper (paru/yay) found. Skipping AUR packages (noctalia-shell, mpvpaper)."
fi

# ---------------------------------------------------------------------
# 2. BACKUP EXISTING CONFIGURATIONS
# ---------------------------------------------------------------------
info "[3/6] Backing up existing configs to $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"

for dir in hypr noctalia kitty nvim gtk-3.0; do
    if [[ -d "$HOME/.config/$dir" ]]; then
        cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        success "Backed up ~/.config/$dir"
    fi
done

if [[ -f "$HOME/.config/starship.toml" ]]; then
    cp "$HOME/.config/starship.toml" "$BACKUP_DIR/"
    success "Backed up ~/.config/starship.toml"
fi

# ---------------------------------------------------------------------
# 3. DEPLOY DOTFILES & ADAPT USER PATHS
# ---------------------------------------------------------------------
info "[4/6] Deploying Nordic minimaLinux × Caelestia configurations..."
mkdir -p "$HOME/.config" "$HOME/Pictures/Screenshots" "$HOME/wallpaper" "$HOME/Videos"

for dir in hypr noctalia kitty nvim gtk-3.0; do
    if [[ -d "$REPO_DIR/config/$dir" ]]; then
        mkdir -p "$HOME/.config/$dir"
        rsync -a "$REPO_DIR/config/$dir/" "$HOME/.config/$dir/"
        success "Installed ~/.config/$dir"
    fi
done

if [[ -f "$REPO_DIR/config/starship.toml" ]]; then
    cp "$REPO_DIR/config/starship.toml" "$HOME/.config/starship.toml"
    success "Installed ~/.config/starship.toml"
fi

# Adapt hardcoded home paths in Noctalia config to the current user's $HOME
if [[ -f "$HOME/.config/noctalia/config.toml" ]]; then
    sed -i "s|/home/tejasvishwasgosavi|$HOME|g" "$HOME/.config/noctalia/config.toml"
    mkdir -p "$HOME/.local/state/noctalia"
    cp "$HOME/.config/noctalia/config.toml" "$HOME/.local/state/noctalia/settings.toml"
    success "Synced Noctalia v5 config & state for user '$USER'"
fi

# ---------------------------------------------------------------------
# 4. PERMISSIONS, SCRIPTS & BONGO CAT INPUT ACCESS
# ---------------------------------------------------------------------
info "[5/6] Setting script permissions & Bongo Cat keyboard ACLs..."

if [[ -d "$HOME/.config/hypr/Scripts" ]]; then
    chmod +x "$HOME/.config/hypr/Scripts/"*.sh 2>/dev/null || true
    success "Marked ~/.config/hypr/Scripts/*.sh as executable"
fi

# Grant evtest read access for the noctalia/bongocat plugin
sudo usermod -aG input "$USER" || true
sudo setfacl -m "u:${USER}:r" /dev/input/event* 2>/dev/null || true
success "Granted /dev/input/event* read access for Bongo Cat"

# Apply GTK dark-mode preferences
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null || true
gsettings set org.gnome.desktop.interface gtk-theme 'Nordzy-dark' 2>/dev/null || true

# ---------------------------------------------------------------------
# 5. OPTIONAL NOCTALIA GREETER SETUP
# ---------------------------------------------------------------------
if [[ -f "$REPO_DIR/system/noctalia-greeter/greeter.toml" ]]; then
    echo ""
    read -rp "Do you want to install the themed Noctalia Greeter config to /var/lib/noctalia-greeter? [y/N]: " install_greeter
    if [[ "${install_greeter,,}" == "y" ]]; then
        sudo install -Dm644 "$REPO_DIR/system/noctalia-greeter/greeter.toml" /var/lib/noctalia-greeter/greeter.toml
        sudo sed -i "s|/home/tejasvishwasgosavi|$HOME|g" /var/lib/noctalia-greeter/greeter.toml
        if id "greetd" &>/dev/null; then
            sudo chown -R greetd:greetd /var/lib/noctalia-greeter
        fi
        success "Installed /var/lib/noctalia-greeter/greeter.toml"
    fi
fi

# ---------------------------------------------------------------------
# 6. RELOAD & VALIDATE
# ---------------------------------------------------------------------
info "[6/6] Validating and reloading environment..."

if command -v noctalia >/dev/null 2>&1; then
    noctalia config validate "$HOME/.config/noctalia" || true
fi

if [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then
    hyprctl reload >/dev/null 2>&1 || true
    success "Reloaded active Hyprland session!"
fi

echo ""
echo -e "${NORD_GREEN}${BOLD}=====================================================================${RESET}"
echo -e "${NORD_GREEN}${BOLD}  Installation Complete!${RESET}"
echo -e "  • Press ${BOLD}SUPER + F1${RESET} to open the interactive HTML manual (docs.html)"
echo -e "  • Press ${BOLD}SUPER + F2${RESET} to open the live Keybind Cheatsheet overlay"
echo -e "  • Backups saved to: ${NORD_BLUE}$BACKUP_DIR${RESET}"
echo -e "${NORD_GREEN}${BOLD}=====================================================================${RESET}"