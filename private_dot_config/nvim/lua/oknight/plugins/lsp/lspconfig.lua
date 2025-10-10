return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		--   vim.lsp.buf.hover { border = "single", max_height = 25 }
		-- end)
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
			-- Add rounded outline to hover panel
			vim.diagnostic.config({
				float = {
					border = "rounded",
				},
			})
			-- TODO: Maybe need this sort of thing
			-- local border = {
			-- 	{ "┌", "FloatBorder" },
			-- 	{ "─", "FloatBorder" },
			-- 	{ "┐", "FloatBorder" },
			-- 	{ "│", "FloatBorder" },
			-- 	{ "┘", "FloatBorder" },
			-- 	{ "─", "FloatBorder" },
			-- 	{ "└", "FloatBorder" },
			-- 	{ "│", "FloatBorder" },
			-- }
			-- -- Add the border on hover and on signature help popup window
			-- local handlers = {
			-- 	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			-- 	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			-- }
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			local lspconfig = require("lspconfig")

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local on_attach = function(client, bufnr) end
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			lspconfig["gopls"].setup({
				lsp_cfg = false,
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					gopls = {
						completeUnimported = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				-- handlers = handlers,
				settings = { -- custom settings for lua
					Lua = {
						hint = { enable = true },
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
				s,
			})
		end,
	},
}
