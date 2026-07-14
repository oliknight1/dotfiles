return {
	"nvim-lualine/lualine.nvim",
	config = function(_, opts)
		require("lualine").setup({
			options = {
				theme = "auto",
				refresh = {
					statusline = 1000, -- Debounce refresh to every 1000ms instead of instantly on autocmd
					tabline = 1000,
					winbar = 1000,
				},
			},
		})
	end,
}
