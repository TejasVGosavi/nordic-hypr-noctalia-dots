-- =====================================================================
-- ~ THEME: Nordic minimaLinux x Caelestia (~/.config/hypr/theme.lua) ~
-- =====================================================================

local nord = {
  polar_night_0 = "rgba(2e3440ff)",
  polar_night_1 = "rgba(3b4252ff)",
  frost_0       = "rgba(8fbcbbff)",
  frost_1       = "rgba(88c0d0ff)",
  frost_3       = "rgba(5e81acff)",
  shadow        = "rgba(181c2466)",
}

hl.config({
  general = {
    border_size      = 2,
    gaps_in          = 6,
    gaps_out         = 12,
    layout           = "dwindle",
    resize_on_border = true,
    col = {
      active_border   = { colors = { nord.frost_1, nord.frost_3 }, angle = 45 },
      inactive_border = nord.polar_night_1,
    },
  },

  decoration = {
    rounding         = 12,
    active_opacity   = 0.98,
    inactive_opacity = 0.93,

    shadow = {
      enabled      = true,
      range        = 15,
      render_power = 4,
      color        = nord.shadow,
    },

    blur = {
      enabled           = true,
      size              = 6,
      passes            = 2,
      ignore_opacity    = true,
      new_optimizations = true,
      xray              = false,
      noise             = 0.02,
      contrast          = 1.0,
      brightness        = 0.95,
      special           = true,
    },
  },

  animations = {
    enabled = true,
  },

  misc = {
    force_default_wallpaper  = 0,
    disable_hyprland_logo    = true,
    disable_splash_rendering = true,
    font_family              = "JetBrainsMono Nerd Font",
    animate_manual_resizes   = true,
  },

  group = {
    col = {
      border_active   = nord.frost_0,
      border_inactive = nord.polar_night_1,
    },
    groupbar = {
      font_family = "JetBrainsMono Nerd Font",
      font_size   = 10,
      col = {
        active   = nord.frost_3,
        inactive = nord.polar_night_0,
      },
    },
  },
})

-- 1. Define Bezier Curves
hl.curve("fluid_ease", { type = "bezier", points = { { 0.15, 1.00 }, { 0.25, 1.00 } } })
hl.curve("overshoot",  { type = "bezier", points = { { 0.12, 1.18 }, { 0.22, 1.02 } } })
hl.curve("quick_out",  { type = "bezier", points = { { 0.23, 1.00 }, { 0.32, 1.00 } } })

-- 2. Complete Animation Tree (Requires root 'global' leaf in Hyprland 0.56)
hl.animation({ leaf = "global",           enabled = true, speed = 8.0, bezier = "fluid_ease" })
hl.animation({ leaf = "border",           enabled = true, speed = 5.0, bezier = "quick_out" })

-- Window Open / Close / Move Animations
hl.animation({ leaf = "windows",          enabled = true, speed = 5.0, bezier = "overshoot",  style = "popin 80%" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 5.0, bezier = "overshoot",  style = "popin 80%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 4.0, bezier = "quick_out",  style = "popin 80%" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 4.5, bezier = "fluid_ease", style = "slide" })

-- Window Opacity Fade on Open / Close
hl.animation({ leaf = "fade",             enabled = true, speed = 4.0, bezier = "fluid_ease" })
hl.animation({ leaf = "fadeIn",           enabled = true, speed = 4.5, bezier = "fluid_ease" })
hl.animation({ leaf = "fadeOut",          enabled = true, speed = 3.5, bezier = "quick_out" })

-- Workspaces & Layers
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5.0, bezier = "overshoot",  style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4.5, bezier = "overshoot",  style = "slidevert" })
hl.animation({ leaf = "layers",           enabled = true, speed = 4.0, bezier = "fluid_ease", style = "fade" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 4.0, bezier = "overshoot",  style = "popin 85%" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 3.0, bezier = "quick_out",  style = "fade" })