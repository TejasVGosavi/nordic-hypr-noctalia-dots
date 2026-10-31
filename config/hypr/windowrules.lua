-- =====================================================================
-- ~ WINDOW RULES: ~/.config/hypr/windowrules.lua (0.56.2 Verified) ~
-- =====================================================================

-- 1. Dolphin File Copy / Progress & KDE Dialogs
hl.window_rule({
  name   = "dolphin-dialogs",
  match  = { class = "^(org\\.kde\\.dolphin)$", title = "^(Copying|Moving|Deleting|Progress|File Already Exists).*$" },
  float  = true,
  center = true,
})

-- 2. Archive Managers, Image Viewers & System Polkit Dialogs
local utility_classes = {
  "^(org\\.kde\\.ark)$",
  "^(org\\.kde\\.polkit-kde-authentication-agent-1)$",
  "^(kvantummanager)$",
  "^(qt5ct|qt6ct)$",
  "^(nwg-look)$",
}

for _, cls in ipairs(utility_classes) do
  hl.window_rule({
    match  = { class = cls },
    float  = true,
    center = true,
    size   = { 860, 600 },
  })
end

-- 3. Gaming & Steam Rules (Immediate tearing + opaque for FPS)
hl.window_rule({
  name   = "steam-friends",
  match  = { class = "^(steam)$", title = "^(Friends List|Steam Settings)$" },
  float  = true,
  center = true,
})

hl.window_rule({
  name   = "cs2-gaming",
  match  = { class = "^(cs2|steam_app_.*)$" },
  opaque = true,
})