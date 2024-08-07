vim.g.mapleader = " "

local keymap = vim.keymap
-- Pane navigation
keymap.set("n", "<C-h>", "<c-w>h", { noremap = true, silent = true })
keymap.set("n", "<C-j>", "<c-w>j", { noremap = true, silent = true })
keymap.set("n", "<C-k>", "<c-w>k", { noremap = true, silent = true })
keymap.set("n", "<C-l>", "<c-w>l", { noremap = true, silent = true })

local opts = { noremap = true, silent = true }

-- keybinds
opts.desc = "Show LSP references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Go to declaration"
keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", '<cmd>lua require("pretty_hover").hover()<CR>', opts)
-- keymap.set("n", "K", vim.lsp.buf.hover, opts)

opts.desc = "See available code actions"
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

opts.desc = "Restart LSP"
keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
vim.keymap.set("n", "<Leader>uh", function()
	vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
end, { desc = "toggle inlay [h]ints" })

opts.desc = "Disable inline virtual text"
keymap.set("n", "<leader>dv", ":lua vim.diagnostic.config{virtual_text=false}<CR>", opts)

keymap.set("v", "<C-c>", '"*y', { noremap = true, silent = true })
