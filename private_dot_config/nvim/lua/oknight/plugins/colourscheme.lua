return {
	{
		"jesseleite/nvim-noirbuddy",
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
		lazy = false,
		priority = 1000,
		opts = {
			preset = "miami-nights",
		},
		config = function(_, opts)
			-- require("noirbuddy").setup(opts)
			-- vim.cmd("colorscheme gruvbuddy")
		end,
	},
	{
		"ficcdaf/ashen.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- require("ashen").load()
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = false
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"thallada/farout.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme("farout")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
}
