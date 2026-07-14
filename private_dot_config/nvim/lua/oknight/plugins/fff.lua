return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		status_text_color = true,
		debug = {
			enabled = true,
		},
		-- Configure grep to prioritize fuzzy mode
		grep = {
			modes = { "fuzzy", "regex", "plain" }, -- The first item sets the default
		},
	},
	lazy = false,
	keys = {
		{
			"<leader>f",
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
