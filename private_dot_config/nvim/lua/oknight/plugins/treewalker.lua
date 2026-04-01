-- Navigate and swap code blocks using treesitter AST nodes
return {
	"aaronik/treewalker.nvim",
	lazy = false,
	keys = {
		{ "<leader>wj", "<cmd>Treewalker Down<cr>", desc = "Treewalker Down" },
		{ "<leader>wk", "<cmd>Treewalker Up<cr>", desc = "Treewalker Up" },
		{ "<leader>wh", "<cmd>Treewalker Left<cr>", desc = "Treewalker Left" },
		{ "<leader>wl", "<cmd>Treewalker Right<cr>", desc = "Treewalker Right" },
		{ "<leader>wJ", "<cmd>Treewalker SwapDown<cr>", desc = "Treewalker Swap Down" },
		{ "<leader>wK", "<cmd>Treewalker SwapUp<cr>", desc = "Treewalker Swap Up" },
		{ "<leader>wH", "<cmd>Treewalker SwapLeft<cr>", desc = "Treewalker Swap Left" },
		{ "<leader>wL", "<cmd>Treewalker SwapRight<cr>", desc = "Treewalker Swap Right" },
	},
	config = function()
		require("treewalker").setup()
	end,
}
