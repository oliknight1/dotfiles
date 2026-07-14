vim.g.mapleader = " "
local utils = require("oknight.core.utils")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Pane navigation
keymap.set("n", "<C-h>", "<c-w>h", opts)
keymap.set("n", "<C-j>", "<c-w>j", opts)
keymap.set("n", "<C-k>", "<c-w>k", opts)
keymap.set("n", "<C-l>", "<c-w>l", opts)

keymap.set("v", "<C-c>", '"*y', opts)
keymap.set("n", "<leader>ti", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, silent = true, desc = "Toggle Inlay Hints" })

vim.keymap.set("n", "<leader>gR", function()
	utils.start_pr_review()
end, { desc = "Git: Start Dynamic PR Review" })

vim.keymap.set("n", "<leader>gX", function()
	require("gitsigns").change_base(nil, true)
	Snacks.notify.warn("Review Mode Disabled")
end, { desc = "Git: Exit PR Review Mode" })
