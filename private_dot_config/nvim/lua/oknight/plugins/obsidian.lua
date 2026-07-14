return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false, -- this will be removed in 4.0.0
		picker = {
			name = "snacks.picker",
		},
		workspaces = {
			{
				name = "work",
				path = "/Users/OliverKnight/Documents/Obsidian Vault",
			},
		},
	},
	config = function(_, opts)
		require("obsidian").setup(opts)
	end,
}
