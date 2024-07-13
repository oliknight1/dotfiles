return {
	"simrat39/symbols-outline.nvim",
	keys = { { "<leader>so", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
	opts = function()
		require("symbols-outline").setup()
	end,
	lazy = false,
}
