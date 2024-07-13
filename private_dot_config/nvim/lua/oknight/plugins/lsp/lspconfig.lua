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
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			-- local pretty_hover = require("pretty_hover")
			-- pretty_hover.setup()

			local opts = { noremap = true, silent = true }

			local keymap = vim.keymap
			local on_attach = function(client, bufnr)
				opts.bufnr = bufnr

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
				settings = {
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_language_server_path,
								languages = { "typescript", "vue" },
							},
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
				filetypes = { "html", "css", "sass", "scss" },
			})
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "html", "css", "sass", "scss" },
			})

			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig["gopls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig["marksman"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
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
