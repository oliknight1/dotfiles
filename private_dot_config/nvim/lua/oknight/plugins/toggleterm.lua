return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- lazy = false,
	-- opts = {},
	config = function(_, opts)
		require("toggleterm").setup()
		local keymap = vim.keymap
		keymap.set("n", "<leader>to", ":ToggleTerm direction=float<CR>", {})
		-- turn terminal to normal mode with escape
		keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
	end,
}
