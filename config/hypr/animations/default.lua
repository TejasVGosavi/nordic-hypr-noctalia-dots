-- =====================================================================
-- ~ DEFAULT PRESET: ~/.config/hypr/animations/default.lua ~
-- =====================================================================

hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("fluid_ease", { type = "bezier", points = { { 0.10, 1.05 }, { 0.15, 1.00 } } })
hl.curve("overshoot",  { type = "bezier", points = { { 0.12, 1.15 }, { 0.20, 1.02 } } })
hl.curve("ease_out",   { type = "bezier", points = { { 0.20, 1.00 }, { 0.30, 1.00 } } })

hl.animation({ leaf = "windows",          enabled = true, speed = 3.5, bezier = "overshoot",  style = "slide" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 3.5, bezier = "fluid_ease", style = "slide" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3.0, bezier = "fluid_ease", style = "slide" })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 3.0, bezier = "fluid_ease" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3.0, bezier = "fluid_ease" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 4.0, bezier = "overshoot",  style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3.5, bezier = "overshoot",  style = "slidevert" })
hl.animation({ leaf = "layers",           enabled = true, speed = 3.5, bezier = "fluid_ease", style = "slide" })