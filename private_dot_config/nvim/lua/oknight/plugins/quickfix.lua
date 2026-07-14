return {
	"stevearc/quicker.nvim",
	ft = "qf",
	---@module "quicker"
	---@type quicker.SetupOptions
	opts = {
		edit = {
			enabled = true,
			autosave = "unmodified",
		},
		follow = {
			enabled = true,
		},
		highlight = {
			treesitter = true,
			lsp = true,
			load_buffers = true,
		},
		keys = {
			{
				">",
				function()
					require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
				end,
				desc = "Expand quickfix context",
			},
			{
				"<",
				function()
					require("quicker").collapse()
				end,
				desc = "Collapse quickfix context",
			},
			{
				"<C-r>",
				function()
					require("quicker").refresh()
				end,
				desc = "Refresh quickfix",
			},
		},
	},
	keys = {
		{
			"<leader>qo",
			function()
				require("quicker").toggle()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>lo",
			function()
				require("quicker").toggle({ loclist = true })
			end,
			desc = "Location List",
		},
	},
}
