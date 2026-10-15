-- Submap visual feedback
local normal_border = hl.get_config("general.col.active_border")

local mode_borders = {
	gaming = {
		colors = { "rgba(00ff88ff)", "rgba(00bb66ff)" },
	},
	resize = {
		colors = { "rgba(ff8800ff)", "rgba(ff3300ff)" },
	},
}

hl.on("keybinds.submap", function(submap)
	hl.config({
		general = {
			col = {
				active_border = mode_borders[submap] or normal_border,
			},
		},
	})
end)
