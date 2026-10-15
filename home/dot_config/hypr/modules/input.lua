hl.config({
	input = {
		kb_layout = "pl",
		repeat_rate = 75,
		repeat_delay = 250,
		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
			tap_to_click = true,
			clickfinger_behavior = true,
			disable_while_typing = true,
		},
	},

	gestures = {
		workspace_swipe_distance = 300,
		workspace_swipe_invert = false,
		workspace_swipe_create_new = false,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
