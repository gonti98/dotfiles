-- Variables
local terminal = "alacritty"
local ipc = "noctalia msg "

-- 1. Core binds
hl.bind(MAIN_MOD .. " + RETURN", hl.dsp.exec_cmd(terminal), {
	description = "Open terminal",
})

hl.bind(MAIN_MOD .. " + SHIFT + RETURN", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"), {
	description = "Open launcher",
})

hl.bind(MAIN_MOD .. " + SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"), {
	description = "Toggle control center",
})

hl.bind(MAIN_MOD .. " + comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"), {
	description = "Toggle settings",
})

hl.bind(MAIN_MOD .. " + I", hl.dsp.exec_cmd(ipc .. "panel-toggle kenn/keybind-cheatsheet:cheatsheet"), {
	description = "Toggle keybind cheatsheet",
})

hl.bind(MAIN_MOD .. " + SHIFT + S", hl.dsp.exec_cmd(ipc .. "screenshot-region"), {
	description = "Screenshot region",
})

hl.bind(MAIN_MOD .. " + BACKSPACE", hl.dsp.exec_cmd("loginctl lock-session"), {
	description = "Lock session",
})

-- 2. Window management
hl.bind(MAIN_MOD .. " + Q", hl.dsp.window.close(), {
	description = "Close active window",
})

hl.bind(
	MAIN_MOD .. " + F",
	hl.dsp.window.fullscreen({
		mode = "fullscreen",
		action = "toggle",
	}),
	{
		description = "Toggle fullscreen",
	}
)

hl.bind(MAIN_MOD .. " + SHIFT + F", function()
	local window = hl.get_active_window()
	if not window then
		return
	end

	if window.floating then
		hl.dispatch(hl.dsp.window.float({ action = "unset" }))
	else
		hl.dispatch(hl.dsp.window.float({ action = "set" }))
		hl.dispatch(hl.dsp.window.center())
	end
end, {
	description = "Toggle floating mode",
})

hl.bind(MAIN_MOD .. " + P", hl.dsp.window.pseudo({ action = "toggle" }), {
	description = "Toggle pseudotile",
})

hl.bind(MAIN_MOD .. " + T", hl.dsp.layout("togglesplit"), {
	description = "Toggle split layout",
})

-- 3. Window navigation
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher hold"), {
	description = "Switch windows",
})

hl.bind(MAIN_MOD .. " + H", hl.dsp.focus({ direction = "left" }), {
	description = "Focus window to the left",
})

hl.bind(MAIN_MOD .. " + L", hl.dsp.focus({ direction = "right" }), {
	description = "Focus window to the right",
})

hl.bind(MAIN_MOD .. " + K", hl.dsp.focus({ direction = "up" }), {
	description = "Focus window above",
})

hl.bind(MAIN_MOD .. " + J", hl.dsp.focus({ direction = "down" }), {
	description = "Focus window below",
})

-- 4. Workspace navigation and window movement
for i = 1, 10 do
	local key = i % 10

	hl.bind(MAIN_MOD .. " + " .. key, hl.dsp.focus({ workspace = i }), {
		description = "Switch to workspace " .. i,
	})

	hl.bind(MAIN_MOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), {
		description = "Move window to workspace " .. i,
	})
end

-- 5. Special workspace
hl.bind(MAIN_MOD .. " + D", hl.dsp.workspace.toggle_special("magic"), {
	description = "Toggle special workspace",
})

hl.bind(MAIN_MOD .. " + SHIFT + D", function()
	local window = hl.get_active_window()
	if not window then
		return
	end

	if window.workspace.name == "special:magic" then
		local workspace = hl.get_active_workspace()
		if workspace then
			hl.dispatch(hl.dsp.window.move({
				workspace = workspace.id,
			}))
		end
	else
		hl.dispatch(hl.dsp.window.move({
			workspace = "special:magic",
		}))
	end
end, {
	description = "Move window to or from special workspace",
})

-- 6. Mouse window controls
hl.bind(MAIN_MOD .. " + mouse:272", hl.dsp.window.drag(), {
	mouse = true,
	description = "Move window with mouse",
})

hl.bind(MAIN_MOD .. " + mouse:273", hl.dsp.window.resize(), {
	mouse = true,
	description = "Resize window with mouse",
})

-- 7. Audio controls: available in all submaps
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), {
	submap_universal = true,
	description = "Increase volume",
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), {
	submap_universal = true,
	description = "Decrease volume",
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"), {
	submap_universal = true,
	description = "Toggle audio mute",
})

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. "mic-mute"), {
	submap_universal = true,
	description = "Toggle microphone mute",
})

-- 8. Brightness controls: available in all submaps
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), {
	submap_universal = true,
	description = "Increase screen brightness",
})

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), {
	submap_universal = true,
	description = "Decrease screen brightness",
})

-- 9. Media playback: default submap only, requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
	locked = true,
	description = "Play next track",
})

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true,
	description = "Toggle playback",
})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
	locked = true,
	description = "Toggle playback",
})

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
	locked = true,
	description = "Play previous track",
})
