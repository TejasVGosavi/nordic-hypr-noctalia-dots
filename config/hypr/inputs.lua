-- =====================================================================
-- ~ INPUTS: ~/.config/hypr/inputs.lua (Hyprland 0.56.2 Verified) ~
-- =====================================================================

hl.config({
  input = {
    kb_layout          = "us",
    numlock_by_default = true,
    repeat_rate        = 35,
    repeat_delay       = 250,
    follow_mouse       = 1,
    sensitivity        = 0,
    accel_profile      = "flat",

    touchpad = {
      natural_scroll       = true,
      disable_while_typing = true,
      tap_to_click         = true,
    },
  },
})

-- Note: 3-finger horizontal workspace swipe is already registered in hyprland.lua.