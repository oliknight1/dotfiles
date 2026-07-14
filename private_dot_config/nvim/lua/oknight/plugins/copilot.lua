return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			-- Crucial: Disable suggestion and panel so they don't clash with blink
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
}
