<div align="center">

# ❄️ Nordic minimaLinux × Caelestia

**A Frosted Arctic Glass Desktop for Hyprland v0.56+ (Lua API) & Noctalia Shell v5 (C++ / TOML)**

![OS](https://img.shields.io/badge/OS-CachyOS%20%2F%20Arch%20Linux-88C0D0?style=for-the-badge&logo=archlinux&logoColor=2E3440)
![WM](https://img.shields.io/badge/WM-Hyprland%20v0.56.2%20(Lua)-81A1C1?style=for-the-badge&logo=wayland&logoColor=2E3440)
![Shell](https://img.shields.io/badge/Shell-Noctalia%20v5%20(TOML)-5E81AC?style=for-the-badge&logoColor=ECEFF4)
![Palette](https://img.shields.io/badge/Palette-Nord%20Glass-8FBCBB?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-A3BE8C?style=for-the-badge)

</div>

---

## ✨ Overview

**Nordic minimaLinux × Caelestia** combines the muted, icy slate tones of the **Nord** colour palette with the thin micro-borders and generous terminal padding of **Echilonvibin's minimaLinux** and the rounded, bouncy physics of the **Caelestia** design language.

Unlike legacy Wayland setups that stitch together separate bars, launchers, notification daemons, and lockscreens, this configuration is built natively on two modern foundations:
1. **Hyprland v0.56.2 Native Lua Engine (`hl.*`):** Zero `.conf` spaghetti. Modular `.lua` files run in isolated scopes with custom bezier physics (`fluid_ease` and `overshoot`), 45° Frost gradient borders, and artefact-free popup blur masks.
2. **Noctalia Shell v5 (Native C++ / TOML):** A unified desktop shell handling the floating island top bar, live CPU/GPU/RAM/HDD gauges, macOS-style magnifying bottom dock, desktop & lockscreen widgets, wallpaper slideshow engine, OSD, Polkit agent, and 14 integrated plugins.

---

## 🖼️ Screenshots

> *Tip: Take screenshots with `Print` (saved to `~/Pictures/Screenshots`), place them in an `assets/` folder in your repo, and update the paths below!*

| Desktop & Widgets | Launcher, Dock & Dashboard |
| :---: | :---: |
| ![Desktop Preview](assets/desktop.png) | ![Dashboard Preview](assets/dashboard.png) |

| Kitty, Fastfetch & Neovim | Interactive Local Manual (`SUPER + F1`) |
| :---: | :---: |
| ![Terminal Preview](assets/terminal.png) | ![Docs Manual Preview](assets/docs.png) |

---

## 🚀 Key Features

- **Floating Island Top Bar:** 38px blurred top bar with Caelestia pill capsules (`capsule_group`), persistent workspace pills, active window title + interactive **Bongo Cat**, a unified **CPU / GPU / RAM / HDD resource monitor**, live audio visualizer, and plugin trays.
- **Magnifying Bottom Application Dock:** Smooth 1.35× hover zoom, running app indicator dots, instance count badges, and a built-in application grid launcher.
- **5 Balanced Desktop Widgets:** Centred hero clock and fancy audio visualizer flanked by a monthly calendar card, live weather card, and media player—plus a matching blurred lockscreen with login widgets.
- **14 Pre-Configured Noctalia v5 Plugins:**
  - `noctalia/bongocat` (Keystroke + audio reactive bar companion)
  - `noctalia/wallhaven` & `noctalia/mpvpaper` (Online Wallhaven browser & hardware-accelerated video wallpapers)
  - `michael-retunzew/hyprland-settings` (Visual GUI for Hyprland 0.56 Lua configs)
  - `kenn/keybind-cheatsheet` (Live searchable `hyprctl binds` overlay on `SUPER + F2`)
  - `yuuto/arch-updater` & `mera/localsend` (Arch/AUR updater graph & LAN file transfer)
  - `umedbazarov/webapp-maker`, `youtube-search`, `web-search`, `zed-provider`, and `world-radio`
- **Built-In Interactive Web Manual (`docs.html`):** Press `SUPER + F1` anytime to open a zero-dependency local web app featuring live keybind filtering, click-to-copy Nord `rgba()` swatches, and customization recipes.
- **Low-Spec GPU Friendly (`gamemode.sh`):** Tuned with 2-pass blur for smooth 1080p @ 60Hz performance even on integrated AMD Radeon R3 graphics, plus a one-command performance booster script.

---

## 📦 Packages & Dependencies

| Component | Package / Tool |
| :--- | :--- |
| **Window Manager** | `hyprland` (`v0.56.2+` with Lua API), `hypridle` |
| **Desktop Shell & Login** | `noctalia-shell` (`v5`), `noctalia-greeter` (`greetd`) |
| **Terminal & Shell** | `kitty`, `fish`, `starship` |
| **Editor & File Manager** | `neovim` (Zero-plugin Lua Nordic Glass), `thunar` (Custom GTK3 Nord CSS) |
| **Plugin Utilities** | `evtest`, `acl`, `mpv`, `mpvpaper`, `pacman-contrib`, `zenity`, `jq`, `socat`, `sqlite` |
| **Clipboard & Media** | `wl-clipboard`, `cliphist`, `brightnessctl`, `playerctl` |
| **Fonts & GTK/Qt Theme** | `ttf-jetbrains-mono-nerd`, `Nordzy-dark` (GTK3/Qt6ct & cursors) |

---

## 🛠️ Installation

### Automatic Installation (Recommended)

Clone this repository into `~/dotfiles` and run the automated installer. It will back up your existing `~/.config` folders before installing dependencies and deploying the rice:

```bash
git clone https://github.com/TejasVGosavi/hypr-noctalia-dots.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

### Backing Up Your Changes to GitHub

Whenever you tweak your setup or Noctalia GUI settings, run the included backup script (or press `SUPER + SHIFT + U`):

```bash
~/.config/hypr/Scripts/backup-dots.sh "feat: update bar widgets"
```

---

## ⌨️ Keybindings Cheat Sheet

> Press **`SUPER + F1`** for the full interactive HTML manual or **`SUPER + F2`** for the live in-compositor cheatsheet overlay.

| Shortcut | Action |
| :--- | :--- |
| <kbd>SUPER</kbd> + <kbd>Return</kbd> | Launch Kitty Terminal |
| <kbd>SUPER</kbd> + <kbd>E</kbd> | Launch Thunar File Manager |
| <kbd>SUPER</kbd> + <kbd>B</kbd> | Launch Web Browser |
| <kbd>SUPER</kbd> + <kbd>SPACE</kbd> | Toggle Noctalia App & Plugin Launcher |
| <kbd>SUPER</kbd> + <kbd>N</kbd> | Toggle Control Center / Dashboard |
| <kbd>SUPER</kbd> + <kbd>V</kbd> | Toggle Clipboard History Panel |
| <kbd>SUPER</kbd> + <kbd>W</kbd> | Open Local Wallpaper & Slideshow Selector |
| <kbd>SUPER</kbd> + <kbd>SHIFT</kbd> + <kbd>W</kbd> | Open **Wallhaven** Online Wallpaper Browser |
| <kbd>SUPER</kbd> + <kbd>CTRL</kbd> + <kbd>W</kbd> | Open **MPVpaper** Video Wallpaper Picker |
| <kbd>SUPER</kbd> + <kbd>,</kbd> | Open Noctalia v5 GUI Settings |
| <kbd>SUPER</kbd> + <kbd>SHIFT</kbd> + <kbd>,</kbd> | Open Hyprland 0.56 Lua Settings GUI |
| <kbd>SUPER</kbd> + <kbd>U</kbd> | Open Arch & AUR Package Updater Panel |
| <kbd>SUPER</kbd> + <kbd>SHIFT</kbd> + <kbd>L</kbd> | Open LocalSend LAN File Transfer Panel |
| <kbd>SUPER</kbd> + <kbd>SHIFT</kbd> + <kbd>B</kbd> | Open Brave WebApp Maker Panel |
| <kbd>SUPER</kbd> + <kbd>F1</kbd> / <kbd>F2</kbd> | Open Local `docs.html` Manual / Live Keybind Cheatsheet |
| <kbd>Print</kbd> / <kbd>SUPER</kbd>+<kbd>SHIFT</kbd>+<kbd>S</kbd> | Fullscreen Screenshot / Region Screenshot + Annotate |
| <kbd>SUPER</kbd> + <kbd>L</kbd> / <kbd>ESC</kbd> | Lock Screen / Open Session Power Menu |
| <kbd>SUPER</kbd> + <kbd>Q</kbd> / <kbd>F</kbd> / <kbd>T</kbd> | Close Window / Fullscreen / Toggle Floating |
| <kbd>SUPER</kbd> + <kbd>1..9</kbd> | Switch to Workspace 1–9 (`SHIFT` to move window) |
| <kbd>SUPER</kbd> + <kbd>S</kbd> / <kbd>SHIFT</kbd>+<kbd>A</kbd> | Toggle Scratchpad (`magic`) / Send Window to Scratchpad |

---

## 📂 Repository Structure

```text
~/dotfiles/
├── install.sh                      # Automated package & config installer
├── .gitignore                      # Excludes runtime state & legacy backups
├── README.md                       # Repository documentation
├── config/
│   ├── gtk-3.0/
│   │   ├── gtk.css                 # Nordic Thunar GTK3 contrast & pathbar fix
│   │   └── settings.ini            # Dark-mode GTK3 settings
│   ├── hypr/
│   │   ├── animations/             # Switchable Caelestia & minimal Lua presets
│   │   ├── Scripts/                # backup-dots.sh, browser-launcher.sh, gamemode.sh
│   │   ├── themes/                 # Modular Nordic border & blur preset
│   │   ├── docs.html               # Local interactive HTML manual (SUPER + F1)
│   │   ├── exec.lua                # Wayland env vars & Noctalia autostart hook
│   │   ├── hypridle.conf           # Idle dim (5m), Noctalia lock (10m) & DPMS (15m)
│   │   ├── hyprland.lua            # Main Hyprland v0.56.2 Lua entry point
│   │   ├── inputs.lua              # Keyboard repeat rate & touchpad config
│   │   ├── keybind.lua             # Compositor & Noctalia IPC keybindings
│   │   ├── monitors.lua            # 1920x1080 @ 60Hz output configuration
│   │   ├── rules.lua               # Frosted layer blur masks & window rules
│   │   ├── startup.lua             # Secondary daemon & GTK theme sync
│   │   ├── theme.lua               # Core Nordic palette, borders & animations
│   │   └── windowrules.lua         # Dialog, archive & gaming window rules
│   ├── kitty/
│   │   └── kitty.conf              # Frosted glass terminal (14px padding, 0.86 alpha)
│   ├── noctalia/
│   │   └── config.toml             # Unified Noctalia v5 bar, dock, widgets & plugins
│   ├── nvim/
│   │   └── init.lua                # Zero-dependency Nordic glass Neovim config
│   └── starship.toml               # Nordic pill prompt with fast scan timeout
└── system/
    └── noctalia-greeter/
        └── greeter.toml            # Matching Nordic greetd login screen config
```

---

## 🙏 Credits & Inspiration

- **[Hyprland](https://hyprland.org/)** — Dynamic tiling Wayland compositor with v0.55+ native Lua configuration.
- **[Noctalia Shell](https://github.com/noctalia-dev)** — Native C++ Wayland desktop shell & plugin ecosystem.
- **Echilonvibin (minimaLinux)** & **Caelestia Dots** — Inspiration for the thin gradient borders, generous terminal padding, and pill-capsule geometry.
- **[Nord Theme](https://www.nordtheme.com/)** — Arctic, north-bluish colour palette.