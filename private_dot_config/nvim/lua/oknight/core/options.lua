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
vim.o.smartindent = true
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 5
vim.o.autoread = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.laststatus = 2
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })

vim.g.mapleader = " "
vim.o.mouse = "a"
vim.o.syntax = "on"
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true

vim.opt.cursorlineopt = "number"

vim.opt.guifont = "font-hack-nerd-font"

vim.opt.colorcolumn = "120"

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

local signs = {
	[vim.diagnostic.severity.ERROR] = "",
	[vim.diagnostic.severity.WARN] = "",
	[vim.diagnostic.severity.INFO] = "",
	[vim.diagnostic.severity.HINT] = "󰠠",
}

vim.diagnostic.config({
	signs = {
		active = true,
		text = signs,
		texthl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},
	virtual_text = true,
	underline = true,
	update_in_insert = true,
	float = { border = "rounded" },
})
