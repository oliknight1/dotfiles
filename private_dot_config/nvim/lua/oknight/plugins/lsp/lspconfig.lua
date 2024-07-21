return {

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"Fildo7525/pretty_hover",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"simrat39/rust-tools.nvim",
		},
		config = function()
			-- Specify how the border looks like
			local border = {
				{ "┌", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "┐", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "┘", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "└", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			-- Add the border on hover and on signature help popup window
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			-- Add border to the diagnostic popup window
			vim.diagnostic.config({
				virtual_text = {
					prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
				},
				float = { border = border },
			})

			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(bufnr, true)
				end
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["jsonls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
			local tsdk = require("mason-registry").get_package("typescript-language-server"):get_install_path()
				.. "/node_modules/typescript/lib"
			lspconfig["tsserver"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
				settings = {
					init_options = {
						preferences = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
							importModuleSpecifierPreference = "non-relative",
						},

						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_language_server_path,
								languages = { "typescript", "vue" },
							},
						},
					},
					javascript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = false,
						},
					},

					typescript = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = false,
						},
					},
					tsserver = {
						-- This overwrite the path from the local project, in case your project ts version is not compatible with the plugin
						path = tsdk,
					},
					filetypes = { "javascript", "typescript", "vue" },
					completions = {
						completeFunctionCalls = true,
					},
				},
			})

			lspconfig["volar"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
				filetypes = { "vue" },
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
			})
			-- lspconfig["vuels"].setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- 	filetypes = { "vue", "javascript", "typescript" },
			-- })

			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
				filetypes = { "html", "css", "sass", "scss" },
			})
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
				filetypes = { "html", "css", "sass", "scss" },
			})

			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
			})
			lspconfig["gopls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
				settings = {
					gopls = {
						usePlaceholders = true,
						completeUnimported = true,
						analyses = {
							unusedparams = true,
						},
						["ui.inlayhint.hints"] = {
							compositeLiteralFields = true,
							constantValues = true,
							parameterNames = true,
						},
						staticcheck = true,
					},
				},
			})
			lspconfig["marksman"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
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
			})
			require("ufo").setup()
		end,
	},
}
