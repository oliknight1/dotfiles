local vim = vim
local augroup = vim.api.nvim_create_augroup("CustomAutocmds", { clear = true })

local function autocmd(event, opts)
  opts.group = opts.group or augroup
  return vim.api.nvim_create_autocmd(event, opts)
end

local doautocmd = vim.api.nvim_exec_autocmds
-- [[ Enable 'after/colors' directory ]]
-- 'after/colors/*.vim' will be sourced after running `:colorscheme *`
-- can be used to override highlight groups of each colorscheme

local function colorscheme(info)
  vim.cmd("runtime! after/colors/common.vim")
  vim.cmd("runtime! after/colors/" .. info.match .. ".vim")

  -- custom hl group used by smart float background below
  local float = vim.api.nvim_get_hl_by_name("FloatBorder", true)
  vim.api.nvim_set_hl(0, "FloatBorderLine", { fg = float.foreground })
end

autocmd("ColorScheme", { callback = colorscheme })
