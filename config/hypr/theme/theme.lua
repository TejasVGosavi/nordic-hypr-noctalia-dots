-- =====================================================================
-- ~ MODULAR THEME PRESET: ~/.config/hypr/themes/theme.lua ~
-- =====================================================================

local nord = {
  polar_0 = "rgba(2e3440ff)",
  polar_1 = "rgba(3b4252ff)",
  frost_0 = "rgba(8fbcbbff)",
  frost_1 = "rgba(88c0d0ff)",
  frost_3 = "rgba(5e81acff)",
  shadow  = "rgba(181c2466)",
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
      inactive_border = nord.polar_1,
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
})