return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- vim.cmd([[colorscheme oxocarbon]])
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#525252", bg = "#161616" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
			})
		end,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"gmr458/vscode_modern_theme.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vscode_modern").setup({
				cursorline = true,
				transparent_background = false,
				nvim_tree_darker = true,
			})
			-- vim.cmd.colorscheme("vscode_modern")
		end,
	},
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("eldritch").setup({
				transparent_background = true,
			})
			-- vim.cmd.colorscheme("eldritch")
		end,
	},
}
