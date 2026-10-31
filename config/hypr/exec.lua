-- =====================================================================
-- ~ EXEC: ~/.config/hypr/exec.lua ~
-- =====================================================================

local env_vars = {
  XDG_CURRENT_DESKTOP                 = "Hyprland",
  XDG_SESSION_TYPE                    = "wayland",
  XDG_SESSION_DESKTOP                 = "Hyprland",
  GDK_BACKEND                         = "wayland,x11,*",
  QT_QPA_PLATFORM                     = "wayland;xcb",
  SDL_VIDEODRIVER                     = "wayland",
  CLUTTER_BACKEND                     = "wayland",
  ELECTRON_OZONE_PLATFORM_HINT        = "auto",
  QT_AUTO_SCREEN_SCALE_FACTOR         = "1",
  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1",
  QT_QPA_PLATFORMTHEME                = "qt6ct",
  XCURSOR_SIZE                        = "24",
  HYPRCURSOR_SIZE                     = "24",
}

for key, val in pairs(env_vars) do
  hl.env(key, val)
end

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("noctalia")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)