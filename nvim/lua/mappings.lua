vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.linebreak = true
vim.o.wrap = false
vim.o.scrolloff = 1
vim.o.laststatus = 2
vim.o.visualbell = true
vim.o.ruler = true
vim.o.exrc = true
vim.o.relativenumber = true
vim.o.cmdheight = 2
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.shiftwidth = 4
vim.o.nu = true
vim.o.hidden = true
vim.o.errorbells = false
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.laststatus = 2
vim.o.foldmethod = 'manual'
vim.o.background = 'dark'
vim.o.shell = 'fish'
vim.g.mapleader = " "
vim.o.mouse = 'a'
vim.o.syntax = 'on'
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'


-- Theme settings
vim.o.termguicolors = true

vim.opt.guifont = 'font-hack-nerd-font'

local keymap = vim.api.nvim_set_keymap

-- Pane navigation
keymap('n', '<C-j>', '<c-w>j', { noremap = true, silent = true })
keymap('n', '<C-k>', '<c-w>k', { noremap = true, silent = true })
keymap('n', '<C-h>', '<c-w>h', { noremap = true, silent = true })
keymap('n', '<C-l>', '<c-w>l', { noremap = true, silent = true })

-- Tab navigation
keymap('', '<leader>tt', ':tabnew<CR>', {})
keymap('', '<leader>tn', ':tabn<CR>', {})
keymap('', '<leader>tp', ':tabp<CR>', {})
keymap('', '<leader>x', ':clo<CR>', {})

-- Buffer navigation
keymap('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', { noremap = true, silent = true })
keymap('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', { noremap = true, silent = true })
keymap('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', { noremap = true, silent = true })
keymap('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', { noremap = true, silent = true })
keymap('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', { noremap = true, silent = true })
keymap('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', { noremap = true, silent = true })
keymap('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', { noremap = true, silent = true })
keymap('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', { noremap = true, silent = true })
keymap('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', { noremap = true, silent = true })
keymap('n', '<leader>$', '<cmd>BufferLineGoToBuffer -1<cr>', { noremap = true, silent = true })
keymap('n', "gb", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })
--These commandshorizon will move the current buffer backwards or forwards in the bufferline
keymap('n', ']b', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
keymap('n', '[b', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
--Close buffer
keymap('n', '<leader>q', '<cmd>:bd<CR>', { noremap = true, silent = false });

-- Rebuild lua file
keymap("n", "<leader>lf", ":luafile %<CR>", { noremap = true, silent = false })

-- Emmet
vim.g.user_emmet_leader_key = '<C-e>'

-- Copy to clipboard
keymap('v', '<C-c>', '"*y', { noremap = true, silent = true })

-- Remove highlight after search
keymap('n', '<leader>/', ':noh<CR>', { noremap = true, silent = true })


--Cmp
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Telescope
keymap("n", "<leader>f", ":lua require'telescope.builtin'.find_files()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>g", ":lua require'telescope.builtin'.live_grep()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>e", ":lua require'telescope.builtin'.diagnostics()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ot", ":Telescope<CR>", { noremap = true, silent = true })
-- file browser
keymap('n', '<leader>b',
	":lua require'telescope.builtin'.find_files{ on_complete = { function() vim.cmd'stopinsert' end } }<CR>",
	{ noremap = true, silent = true })

-- Dap

keymap("n", "<leader>ds", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>so", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>si", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>sb", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>t", ":lua require'dap'.terminate()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ noremap = true, silent = true })
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ noremap = true, silent = true })
keymap("n", "<leader>r", ":lua require'dap'.run_last()<CR>", { noremap = true, silent = true })
--keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>",{ noremap = true, silent = true})
--keymap("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>",{ noremap = true, silent = true})


-- Terminal
-- turn terminal to normal mode with escape
keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- start terminal in insert mode
vim.api.nvim_exec([[ au BufEnter * if &buftype == 'terminal' | :startinsert | endif ]], false)

-- open terminal on ctrl+n

vim.api.nvim_exec([[
function! OpenTerminal()
	split term://fish
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
]], false)

-- Commenter
local opt = { expr = true, remap = true }

-- Toggle using count
keymap('n', 'cl',
	"v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'",
	{ noremap = true, silent = true, expr = true })
-- keymap('n', '<leader>cb', "v:count == 0 ? '<Plug>(comment_toggle_current_blockwise)' : '<Plug>(comment_toggle_blockwise_count)'",{ noremap = true, silent = true, expr =true } )

local autocmd = vim.api.nvim_create_autocmd

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Indent line toggle
keymap('n', '<leader>it', '<cmd>IndentBlanklineToggle<cr>', {})

--Autoformat
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

vim.diagnostic.config({
	virtual_text = true,
})

-- Troulbe
keymap("n", "<leader>tx", "<cmd>Trouble<cr>",
	{ silent = true, noremap = true }
)
keymap("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>",
	{ silent = true, noremap = true }
)
keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>",
	{ silent = true, noremap = true }
)
keymap("n", "<leader>tl", "<cmd>Trouble loclist<cr>",
	{ silent = true, noremap = true }
)
keymap("n", "<leader>tq", "<cmd>Trouble quickfix<cr>",
	{ silent = true, noremap = true }
)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
	{ silent = true, noremap = true }
)
