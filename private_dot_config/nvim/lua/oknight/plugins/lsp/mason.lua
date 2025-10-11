return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local lspconfig = require("lspconfig")

		-- Mason UI
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Mason LSP
		mason_lspconfig.setup({
			ensure_installed = {
				"gopls",
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"graphql",
				"emmet_ls",
				"pyright",
				"marksman",
			},
			automatic_installation = true,
		})

		-- Mason Tool Installer
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"ruff",
				"eslint",
				"staticcheck",
				"goimports",
			},
		})

		-- LSP defaults
		local on_attach = function(client, bufnr) end
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Manually setup servers (instead of setup_handlers)
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
				settings = {
					gopls = {
						completeUnimported = true,
						analyses = { unusedparams = true },
						staticcheck = true,
					},
				},
			},
		}

		for name, config in pairs(servers) do
			config.capabilities = capabilities
			config.on_attach = on_attach
			lspconfig[name].setup(config)
		end
	end,
}
