return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = { -- (optional)
		debug = {
			enabled = true, -- we expect your collaboration at least during the beta
			show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
		},
	},
	-- No need to lazy-load with lazy.nvim.
	lazy = false,
	keys = {
		{
			"<leader>f", -- try it if you didn't it is a banger keybinding for a picker
			function()
				require("fff").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>/",
			function()
				require("fff").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>cw",
			function()
				require("fff").live_grep({ query = vim.fn.expand("<cword>") })
			end,
			desc = "Search current word",
		},
	},
}
