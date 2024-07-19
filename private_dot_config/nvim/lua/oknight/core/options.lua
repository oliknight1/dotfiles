vim.o.ignorecase = true
vim.o.encoding = "UTF-8"
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.linebreak = true
vim.o.listchars = "eol:$"
vim.o.wrap = false
vim.o.scrolloff = 1
vim.o.visualbell = true
vim.o.ruler = true
vim.o.exrc = true
vim.o.relativenumber = true
vim.o.cmdheight = 2
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.nu = true
vim.o.hidden = true
vim.o.errorbells = false
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.autoindent = true
vim.o.smartindent = false
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 5
vim.o.autoread = true

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.laststatus = 2
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.g.mapleader = " "
vim.o.mouse = "a"
vim.o.syntax = "on"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true

vim.opt.cursorlineopt = "number"

vim.opt.guifont = "font-hack-nerd-font"

vim.g.copilot_no_tab_map = true

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Add outline to hover panel
vim.diagnostic.config({
	float = {
		border = "rounded",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
