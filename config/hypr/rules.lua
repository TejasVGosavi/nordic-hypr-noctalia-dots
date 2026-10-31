-- =====================================================================
-- ~ RULES: ~/.config/hypr/rules.lua ~
-- =====================================================================

-- 1. Noctalia v5 Layer Rules (no_anim = true lets Noctalia use its own native panel animations)
hl.layer_rule({
  name         = "noctalia-blur",
  match        = { namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$" },
  blur         = true,
  blur_popups  = true,
  ignore_alpha = 0.5,
  no_anim      = true,
})

-- Float Thunar file operation progress / rename dialogs
hl.window_rule({
  name   = "thunar-dialogs",
  match  = { class = "^(thunar|Thunar)$", title = "^(File Operation Progress|Rename.*|Confirm.*)$" },
  float  = true,
  center = true,
})

-- 1. Noctalia v5 Layer Rules (match table required in 0.56.2)
hl.layer_rule({
  name         = "noctalia-blur",
  match        = { namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$" },
  blur         = true,
  ignore_alpha = 0.25,
  xray         = false,
})

hl.layer_rule({
  name    = "noctalia-screenshot",
  match   = { namespace = "^noctalia-screenshot$" },
  no_anim = true,
})

-- 2. Persistent Workspaces (1-5)
for i = 1, 5 do
  hl.workspace_rule({
    workspace  = tostring(i),
    persistent = true,
  })
end

-- 3. Window Rules
hl.window_rule({
  name   = "noctalia-settings",
  match  = { class = "^(dev\\.noctalia\\.Noctalia)$" },
  float  = true,
  center = true,
  size   = { 1080, 920 },
})

local floating_classes = {
  "^(org\\.pulseaudio\\.pavucontrol)$",
  "^(nm-connection-editor)$",
  "^(blueman-manager)$",
  "^(xdg-desktop-portal-gtk)$",
  "^(org\\.gnome\\.Calculator)$",
}

for _, cls in ipairs(floating_classes) do
  hl.window_rule({
    match  = { class = cls },
    float  = true,
    center = true,
    size   = { 820, 560 },
  })
end

hl.window_rule({
  name              = "pip",
  match             = { title = "^(Picture-in-Picture|Picture in picture)$" },
  float             = true,
  pin               = true,
  keep_aspect_ratio = true,
  size              = { 480, 270 },
})

hl.window_rule({
  match  = { class = "^(mpv|imv|vlc)$" },
  opaque = true,
})
