vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Pane navigation

keymap.set("n", "<C-h>", "<c-w>h", opts)
keymap.set("n", "<C-j>", "<c-w>j", opts)
keymap.set("n", "<C-k>", "<c-w>k", opts)
keymap.set("n", "<C-l>", "<c-w>l", opts)


keymap.set("v", "<C-c>", '"*y', opts)
