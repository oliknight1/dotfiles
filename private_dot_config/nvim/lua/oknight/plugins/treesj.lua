-- Split or join blocks (arrays, objects, args) between single and multi-line
return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	keys = {
		{
			"<leader>m",
			function()
				require("treesj").toggle()
			end,
			desc = " TreeSJ Toggle Split/Join Block",
		},
		{
			"<leader>M",
			function()
				require("treesj").toggle({ split = { recursive = true } })
			end,
			desc = "Recursive Split Block",
		},
	},
	opts = {
		use_default_keymaps = false,
	},
	config = function()
		require("treesj").setup()
	end,
}
