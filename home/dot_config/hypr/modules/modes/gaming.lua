-- Gaming submap
hl.bind(MAIN_MOD .. " + SHIFT + G", function()
	hl.dispatch(hl.dsp.submap("gaming"))
	hl.dispatch(
		hl.dsp.exec_cmd(
			[[notify-send -a Hyprland "Gaming mode: ON" "Regular shortcuts disabled. Exit: SUPER + SHIFT + G"]]
		)
	)
end, {
	description = "Enter gaming mode",
})

hl.define_submap("gaming", function()
	hl.bind(MAIN_MOD .. " + SHIFT + G", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd([[notify-send -a Hyprland "Gaming mode: OFF" "Regular shortcuts restored"]]))
	end, {
		description = "Exit gaming mode",
	})
end)
