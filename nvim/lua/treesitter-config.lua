

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "toml",
    "fish",
    "json",
    "yaml",
    "html",
    "scss",
		"javascript",
		"typescript"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
require('nvim-ts-autotag').setup()
