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
			vim.g.gruvbox_material_transparent_background = 2
			vim.g.gruvbox_material_background = "hard"
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
			-- vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd("colorscheme solarized-osaka")
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			-- require("tokyodark").setup(opts) -- calling setup is optional
			-- vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("lackluster")
			-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
			-- vim.cmd.colorscheme("lackluster-mint")
		end,
	},
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			-- require("flow").setup({})
			-- vim.cmd("colorscheme flow-mono")
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			-- vim.g.gruvbox_baby_transparent_mode = 1
			-- vim.cmd("colorscheme gruvbox-baby")
		end,
	},
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("citruszest").setup({
				option = {
					transparent = true,
					bold = false,
					italic = fale,
				},
			})
			-- vim.cmd("colorscheme citruszest")
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("dracula").setup()
			-- vim.cmd("colorscheme dracula")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			require("tokyonight").setup({
				transparent = true,
			})
			-- vim.cmd("colorscheme tokyonight-night")
		end,
	},
	{
		"rktjmp/lush.nvim",
		-- if you wish to use your own colorscheme:
		-- { dir = '/absolute/path/to/colorscheme', lazy = true },
	},
	{
		"shaunsingh/moonlight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			vim.g.moonlight_disable_background = true
			-- vim.cmd("colorscheme moonlight")
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		-- Add in any other configuration;
		--   event = foo,
		--   config = bar
		--   end,
		config = function(_, opts)
			vim.opt.background = "dark"
			-- vim.cmd.colorscheme("oxocarbon")
			--
			-- local groups = { "LineNr", "CursorLineNr", "SignColumn", "Normal", "NormalFloat", "NormalNC" }
			-- for _, group in ipairs(groups) do
			-- 	vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
			-- end
			-- vim.api.nvim_set_hl(0, "@variable.typescript", { fg = "#ff7eb6" })
			-- vim.api.nvim_set_hl(0, "@function.call.typescript", { fg = "#ff7eb6" })
		end,
	},
	{
		"vague-theme/vague.nvim",
		config = function(_, opts)
			-- vim.cmd.colorscheme("vague")
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require("cyberdream").setup({
				-- Set light or dark variant
				variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

				-- transparent = true,

				-- Reduce the overall saturation of colours for a more muted look
				saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = true,

				-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
				borderless_pickers = false,

				-- Set terminal colors used in `:terminal`
				terminal_colors = true,
			})
			vim.cmd("colorscheme cyberdream")
		end,
	},
	{
		"samharju/synthweave.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("synthweave-transparent")
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("monokai-pro").setup()
			-- vim.cmd.colorscheme("monokai-pro")
		end,
	},
}
