-- Split or join blocks (arrays, objects, args) between single and multi-line
return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	keys = {
		{ "<leader>tjm", "<cmd>TSJToggle<cr>", desc = "Toggle Split/Join Block" },
		{ "<leader>tjj", "<cmd>TSJJoin<cr>", desc = "Join Block" },
		{ "<leader>tjs", "<cmd>TSJSplit<cr>", desc = "Split Block" },
	},
	opts = {
		use_default_keymaps = false,
	},
	config = function()
		require("treesj").setup()
	end,
}
