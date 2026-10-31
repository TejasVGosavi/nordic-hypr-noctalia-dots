-- =====================================================================
-- ~ MAIN ENTRY: ~/.config/hypr/hyprland.lua ~
-- =====================================================================

-- 1. Monitor Configuration
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = 1,
})

-- 2. Core Input & Layout Config
hl.config({
  input = {
    kb_layout     = "us",
    follow_mouse  = 1,
    sensitivity   = 0,
    accel_profile = "flat",

    touchpad = {
      natural_scroll       = true,
      disable_while_typing = true,
      tap_to_click         = true,
    },
  },

  dwindle = {
    preserve_split = true,
    smart_split    = false,
    smart_resizing = true,
  },

  master = {
    new_status = "master",
    mfact      = 0.55,
  },

  binds = {
    workspace_back_and_forth = false,
    allow_workspace_cycles   = true,
    pass_mouse_when_bound    = false,
  },
})

-- 3. Touchpad 3-Finger Workspace Swipe
hl.gesture({
  fingers   = 3,
  direction = "horizontal",
  action    = "workspace",
})

-- 4. Load Modular Files
require("theme")
require("exec")
require("rules")
require("keybind")


pcall(require, "inputs")
pcall(require, "startup")
pcall(require, "windowrules")

-- For Noctalia Color templates
require("noctalia").apply_theme()
