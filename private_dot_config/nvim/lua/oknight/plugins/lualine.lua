return {
	"nvim-lualine/lualine.nvim",
	config = function(_, opts)
		local noirbuddy_lualine = require("noirbuddy.plugins.lualine")
		require("lualine").setup({
			options = {
				theme = noirbuddy_lualine.theme,
				-- ...
			},
			sections = noirbuddy_lualine.sections,
			inactive_sections = noirbuddy_lualine.inactive_sections,
		})
	end,
}
