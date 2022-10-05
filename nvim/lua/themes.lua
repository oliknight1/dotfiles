vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

 require("catppuccin").setup()
 require("onedark").setup({
 	style = 'warmer'
 })
require('nvim-tundra').setup({
  transparent_background = false,
  editor = {
    search = {},
    substitute = {},
  },
  syntax = {
    conditionals = {},
    functions = {},
    keywords = {},
    loops = {},
    punctuation = {},
    strings = {},
    types = { italic = true },
  },
  diagnostics = {
    errors = {},
    warnings = {},
    information = {},
    hints = {},
  },
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    context = true,
    dbui = true,
    gitsigns = true,
    telescope = true,
  },
  overwrite = {
    colors = {},
    highlights = {},
  },
})

vim.o.termguicolors = true
vim.opt.background = 'dark'
vim.cmd('colorscheme tundra')

