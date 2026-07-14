vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		-- the 'o' is meant to be there, this makes it go into insert mode
		vim.keymap.set("n", "<leader>cl", 'oconsole.log("------------------------");<Esc>', {
			buffer = true,
			desc = "Insert console.log separator",
		})
	end,
})

return {
	"pmizio/typescript-tools.nvim",
	ft = { "typescript", "javascript" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		handlers = {
			-- Only publish error-severity diagnostics from tsserver; eslint_d handles warnings
			["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
				result.diagnostics = vim.tbl_filter(function(d)
					return d.severity == vim.diagnostic.severity.ERROR
				end, result.diagnostics)
				vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
			end,
		},
		settings = {
			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all",
				includeInlayReturnTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
	keys = {
		{ "<leader>oi", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
		{ "<leader>ri", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
		{ "<leader>gs", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Source Definition" },
		{ "<leader>tR", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
	},
}
