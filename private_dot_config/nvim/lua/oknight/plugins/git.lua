return {

	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		keys = {
			{
				"]h",
				"<cmd>lua require('gitsigns').next_hunk()<CR>",
				desc = " GitSigns Next Hunk",
			},
			{
				"[h",
				"<cmd>lua require('gitsigns').prev_hunk()<CR>",
				desc = "GitSigns Prev Hunk",
			},
			{
				"<leader>ghs",
				"<cmd>lua require('gitsigns').stage_hunk()<CR>",
				desc = "GitSigns Stage Hunk",
			},
			{
				"<leader>ghr",
				"<cmd>lua require('gitsigns').reset_hunk()<CR>",
				desc = "GitSigns Reset Hunk",
			},
			{
				"<leader>ghS",
				"<cmd>lua require('gitsigns').stage_buffer()<CR>",
				desc = "GitSigns Stage Buffer",
			},
			{
				"<leader>ghu",
				"<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
				desc = "GitSigns Undo Stage Hunk",
			},
			{
				"<leader>ghR",
				"<cmd>lua require('gitsigns').reset_buffer()<CR>",
				desc = "GitSigns Reset Buffer",
			},
			{
				"<leader>ghp",
				"<cmd>lua require('gitsigns').preview_hunk()<CR>",
				desc = "GitSigns Preview Hunk",
			},
			{
				"<leader>ghb",
				"<cmd>lua require('gitsigns').blame_line({ full = true })<CR>",
				desc = "GitSigns Blame Line",
			},
			{
				"<leader>ghd",
				"<cmd>lua require('gitsigns').diffthis()<CR>",
				desc = "GitSigns Diff This",
			},
			{
				"<leader>ghD",
				"<cmd>lua require('gitsigns').diffthis('~')<CR>",
				desc = "GitSigns Diff This ~",
			},
			-- {
			-- 	{ "o", "x" },
			-- 	"ih",
			-- 	"<cmd>lua require('gitsigns').select_hunk()<CR>",
			-- 	desc=" GitSigns GitSigns Select Hunk",
			-- },
		},
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
	},
}
