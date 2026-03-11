return {
	"pmizio/typescript-tools.nvim",
	ft = { "typescript", "javascript" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
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
