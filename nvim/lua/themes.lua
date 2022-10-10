vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha


require("nightfox").setup({
  options = {
    transparent = true;
  }
})

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
})
require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    treesitter = true,
    cmp = true,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  color_overrides = {},
  highlight_overrides = {},
})
require("gruvbox").setup({
  bold = false,
  transparent_mode = true,
})
require("onedark").setup({
  style = 'warmer'
})
require('nvim-tundra').setup({
  transparent_background = true,
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
vim.g.oxocarbon_lua_keep_terminal = true
vim.g.oxocarbon_lua_transparent = true
vim.g.oxocarbon_lua_disable_bold = true

vim.g.tokyodark_transparent_background = true 

vim.cmd('colorscheme carbonfox')
