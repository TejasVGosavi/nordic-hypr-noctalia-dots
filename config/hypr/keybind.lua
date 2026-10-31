-- =====================================================================
-- ~ KEYBINDS: ~/.config/hypr/keybind.lua (Noctalia v5 Verified) ~
-- =====================================================================

local terminal    = "kitty"
local filemanager = "thunar"
local browser     = "brave"
local ipc         = "noctalia msg "

-- 1. Noctalia Shell v5 IPC Binds
hl.bind("SUPER + space",     hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind("SUPER + N",         hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind("SUPER + V",         hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"))
hl.bind("SUPER + W",         hl.dsp.exec_cmd(ipc .. "panel-toggle wallpaper"))
hl.bind("SUPER + escape",    hl.dsp.exec_cmd(ipc .. "panel-toggle session"))
hl.bind("SUPER + comma",     hl.dsp.exec_cmd(ipc .. "settings-toggle"))       -- Fixed: opens Noctalia Settings GUI
hl.bind("ALT + Tab",         hl.dsp.exec_cmd(ipc .. "window-switcher hold"))
hl.bind("SUPER + L",         hl.dsp.exec_cmd(ipc .. "session lock"))          -- Fixed: canonical v5 lock command

-- Fixed Screenshots (Fullscreen & Region)
hl.bind("Print",             hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen")) -- Fixed: fullscreen capture
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(ipc .. "screenshot-region"))

-- Hardware Audio & Brightness Keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. "volume-up"),       { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. "volume-down"),     { repeating = true, locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. "volume-mute"),     { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. "brightness-up"),   { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), { repeating = true, locked = true })

-- 2. Core Apps & Window Management (Updated to Thunar)
hl.bind("SUPER + Return",    hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E",         hl.dsp.exec_cmd(filemanager))
hl.bind("SUPER + B",         hl.dsp.exec_cmd(browser))
hl.bind("SUPER + Q",         hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())
hl.bind("SUPER + F",         hl.dsp.window.fullscreen())
hl.bind("SUPER + T",         hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P",         hl.dsp.window.pseudo())
hl.bind("SUPER + J",         hl.dsp.layout("togglesplit"))
hl.bind("SUPER + G",         hl.dsp.group.toggle())

-- 3. Focus, Movement & Mouse Binds
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + CTRL + right", hl.dsp.window.resize({ x = 40,  y = 0,   relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + left",  hl.dsp.window.resize({ x = -40, y = 0,   relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + up",    hl.dsp.window.resize({ x = 0,   y = -40, relative = true }), { repeating = true })
hl.bind("SUPER + CTRL + down",  hl.dsp.window.resize({ x = 0,   y = 40,  relative = true }), { repeating = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- 4. Workspaces (1-9) & Scratchpad
for i = 1, 9 do
  local key = tostring(i)
  hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
  hl.bind("SUPER + CTRL + " .. key,  hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + S",          hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + A",  hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("SUPER + F1", hl.dsp.exec_cmd("brave ~/.config/hypr/docs.html"))

-- =====================================================================
-- ~ 5. DOCS MANUAL & NOCTALIA v5 PLUGIN PANELS (~/.config/hypr/keybind.lua) ~
-- =====================================================================
local ipc = "noctalia msg "

-- Local HTML Manual (SUPER + F1) & Live Keybind Cheatsheet Plugin (SUPER + F2)
hl.bind("SUPER + F1",            hl.dsp.exec_cmd("brave ~/.config/hypr/docs.html"))
hl.bind("SUPER + F2",            hl.dsp.exec_cmd(ipc .. "panel-toggle kenn/keybind-cheatsheet:cheatsheet"))

-- Wallhaven Browser (SUPER + SHIFT + W) & Video Wallpaper Picker (SUPER + CTRL + W)
hl.bind("SUPER + SHIFT + W",     hl.dsp.exec_cmd(ipc .. "panel-toggle noctalia/wallhaven:browser"))
hl.bind("SUPER + CTRL + W",      hl.dsp.exec_cmd(ipc .. "panel-toggle noctalia/mpvpaper:picker"))

-- Hyprland Lua Settings GUI, WebApp Maker, LocalSend & Arch Updater
hl.bind("SUPER + SHIFT + comma", hl.dsp.exec_cmd(ipc .. "panel-toggle michael-retunzew/hyprland-settings:panel"))
hl.bind("SUPER + SHIFT + B",     hl.dsp.exec_cmd(ipc .. "panel-toggle umedbazarov/webapp-maker:panel"))
hl.bind("SUPER + SHIFT + L",     hl.dsp.exec_cmd(ipc .. "panel-toggle mera/localsend:panel"))
hl.bind("SUPER + U",             hl.dsp.exec_cmd(ipc .. "panel-toggle yuuto/arch-updater:panel"))
