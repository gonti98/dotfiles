---- GLOBAL VARIABLES ----
MAIN_MOD = "SUPER"

---- MONITORS ----
require("modules/monitors")

---- AUTOSTART ----
require("modules/autostart")

---- ENVIRONMENT VARIABLES ----
require("modules/env")

----- PERMISSIONS -----
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

---- LOOK AND FEEL ----
require("modules/appearance")

----  MISC  ----
require("modules/misc")

---- INPUT ----
require("modules/input")

---- KEYBINDINGS ----
require("modules/keybindings")
-- modes --
require("modules.modes.gaming")
require("modules.modes.resize")
require("modules.modes.feedback")

---- WINDOWS AND WORKSPACES ----
require("modules/workspaces")

-- For Noctalia Color templates
require("noctalia").apply_theme()
