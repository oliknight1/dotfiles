return {
	"olexsmir/gopher.nvim",
	ft = "go",
	-- branch = "develop"
	-- (optional) will update plugin's deps on every update
	build = function()
		vim.cmd.GoInstallDeps()
	end,
	---@type gopher.Config
	opts = {},
	keys = {
		{ "<leader>ie", "<cmd>GoIfErr<cr>", desc = "Go if err != nil" },
	},
	config = function(_, opts)
		require("gopher").setup(opts)
	end,
}
