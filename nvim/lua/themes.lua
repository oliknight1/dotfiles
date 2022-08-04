vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()
require("onedark").setup({
	style = 'warmer'
})

vim.cmd [[colorscheme onedark]]

