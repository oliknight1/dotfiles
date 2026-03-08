local function lsp_float(fn)
	return function()
		fn({ border = "rounded", max_height = 25 })
	end
end
return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		keys = {
			{ "K", lsp_float(vim.lsp.buf.hover), desc = "LSP Hover / Documentation" },
			{ "<C-k>", lsp_float(vim.lsp.buf.signature_help), desc = "LSP Signature Help" },
			{ "gR", "<cmd> Telescope lsp_references<CR>", desc = "Show LSP references (Telescope)" },
			{ "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
			{ "gi", "<Cmd>lua vim.lsp.buf.implementations()<CR>", desc = "Go to implementations" },
			{ "gt", "<Cmd>lua vim.lsp.buf.type_definitions()<CR>", desc = "Go to type defintion" },
			{ "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
			{ "<leader>rs", "<Cmd>LSPRestart<CR>", desc = "LSP Restart" },
		},
		config = function()
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", max_height = 25 })

			local lspconfig = require("lspconfig")
			local util = lspconfig.util
			local on_attach = function(client, bufnr) end
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							hint = { enable = true },
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				},
				gopls = {
					root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
					settings = {
						gopls = {
							usePlaceholders = true,
							completeUnimported = true,
							analyses = { unusedparams = true },
							staticcheck = true,
						},
					},
				},
				tsserver = {}, -- TypeScript / JavaScript LSP
				jsonls = {
					root_dir = util.root_pattern(".git", "package.json", "tsconfig.json"),
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
			}

			for name, conf in pairs(servers) do
				conf = vim.tbl_deep_extend("force", {
					on_attach = on_attach,
					capabilities = capabilities,
				}, conf or {})
				lspconfig[name].setup(conf)
			end
		end,
	},
}
