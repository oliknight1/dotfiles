return {
	"aaronik/treewalker.nvim",
	lazy = false,
	keys = {
		{
			"<A-j>",
			"<cmd>Treewalker Down<cr>",
		},
		{
			"<A-k>",
			"<cmd>Treewalker Up<cr>",
		},
		{
			"<A-h>",
			"<cmd>Treewalker Left<cr>",
		},
		{
			"<A-l>",
			"<cmd>Treewalker Right<cr>",
		},
		{
			"<A-S-j>",
			"<cmd>Treewalker SwapDown<cr>",
		},
		{
			"<A-S-k>",
			"<cmd>Treewalker SwapUp<cr>",
		},
		{
			"<A-S-h>",
			"<cmd>Treewalker SwapLeft<cr>",
		},
		{
			"<A-S-l>",
			"<cmd>Treewalker SwapRight<cr>",
		},
	},
	config = function()
		require("treewalker").setup()
	end,
}
