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
			require("noirbuddy").setup(opts)
		end,
	},
}
