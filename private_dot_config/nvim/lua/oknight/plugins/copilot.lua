return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	lazy = false,
	config = function()
		require("copilot").setup({
			panel = { enabled = false },
			suggestion = {
				auto_trigger = true,
				panel = { enabled = false },
				keymap = {
					accept = "<C-j>",
				},
			},
		})
	end,
}
