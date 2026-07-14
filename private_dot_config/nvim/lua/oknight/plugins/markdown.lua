return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	keys = {
		{ "<leader>tm", "<cmd>Markview<cr>", desc = "Toggle markdown preview" },
	},

	-- Completion for `blink.cmp`
	dependencies = { "saghen/blink.cmp" },
	config = function(opts)
		local presets = require("markview.presets")
		require("markview").setup({
			opts = {
				preview = {
					enable = false,
				},
				markdown = {
					tables = presets.rounded,
					headings = presets.glow,
					block_quotes = presets.obsidian,
				},
			},
		})
	end,
}
