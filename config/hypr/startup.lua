-- =====================================================================
-- ~ STARTUP: ~/.config/hypr/startup.lua ~
-- =====================================================================

hl.env("GTK_THEME", "Nordzy-dark")

hl.on("hyprland.start", function()
  -- Start standalone idle daemon (reads ~/.config/hypr/hypridle.conf)
  hl.exec_cmd("hypridle")

  -- Apply Nordzy-dark GTK theme & cursor settings via gsettings
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Nordzy-dark'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")
end)