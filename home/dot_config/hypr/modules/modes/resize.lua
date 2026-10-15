-- Resize submap
hl.bind(MAIN_MOD .. " + SHIFT + R", function()
	if not hl.get_active_window() then
		return
	end

	hl.dispatch(hl.dsp.submap("resize"))
end, {
	description = "Toggle resize mode",
})

hl.define_submap("resize", function()
	local function resize_window(x_factor, y_factor)
		local window = hl.get_active_window()
		if not window then
			return
		end

		hl.dispatch(hl.dsp.window.resize({
			x = math.floor(window.size.x * x_factor),
			y = math.floor(window.size.y * y_factor),
			relative = true,
		}))
	end

	hl.bind("H", function()
		resize_window(-0.05, 0)
	end, {
		repeating = true,
		description = "Resize window left",
	})

	hl.bind("L", function()
		resize_window(0.05, 0)
	end, {
		repeating = true,
		description = "Resize window right",
	})

	hl.bind("K", function()
		resize_window(0, -0.05)
	end, {
		repeating = true,
		description = "Resize window up",
	})

	hl.bind("J", function()
		resize_window(0, 0.05)
	end, {
		repeating = true,
		description = "Resize window down",
	})

	hl.bind("ESCAPE", hl.dsp.submap("reset"), {
		description = "Exit resize mode",
	})

	hl.bind(MAIN_MOD .. " + SHIFT + R", hl.dsp.submap("reset"), {
		description = "Exit resize mode",
	})
end)
