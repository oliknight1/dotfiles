return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"K",
				function()
					vim.lsp.buf.signature_help({ border = "rounded", max_height = 25 })
				end,
				desc = "LSP signature help",
			},
			{
				"gR",
				"<cmd> Telescope lsp_references<CR>",
				desc = "Show LSP references (Telescope)",
			},
			{
				"gD",
				"<Cmd>lua vim.lsp.buf.declaration()<CR>",
				desc = "Go to declaration",
			},
			{
				"gi",
				"<Cmd>lua vim.lsp.buf.implementations()<CR>",
				desc = "Go to implementations",
			},
			{
				"gt",
				"<Cmd>lua vim.lsp.buf.type_definitions()<CR>",
				desc = "Go to type defintion",
			},
			{
				"<leader>ca",
				"<Cmd>lua vim.lsp.buf.code_action()<CR>",
				desc = "Code action",
			},
			{
				"<leader>rs",
				"<Cmd>LSPRestart<CR>",
				desc = "LSP Restart",
			},
		},
		config = function()
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		end,
	},
}
