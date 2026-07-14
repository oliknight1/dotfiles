return {
	"sindrets/diffview.nvim",
	lazy = false,
	keys = {
		{ "<leader>dvo", "<cmd> DiffviewOpen<CR>", desc = "Diff View Open" },
		{ "<leader>dvc", "<cmd> DiffviewClose<CR>", desc = "Diff View Close" },
	},
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
			use_icons = true,
			signs = {
				fold_closed = "",
				fold_open = "",
			},
			-- default_args = {
			-- 	DiffviewOpen = {
			-- 		"--imply-local",
			-- 	},
			-- },
			hooks = {
				-- diff_buf_read = function(bufnr)
				-- 	local name = vim.api.nvim_buf_get_name(bufnr)
				--
				-- 	-- Check if it's a typescript file inside the diffview
				-- 	if name:match("%.ts$") or name:match("%.tsx$") then
				-- 		-- 1. Set filetype so LSP triggers
				-- 		vim.bo[bufnr].filetype = "typescript"
				--
				-- 		-- 2. Manually start/attach the LSP to this buffer
				-- 		-- This bypasses the plugin's automatic filter that causes the error
				-- 		require("typescript-tools.api").setup_client(bufnr)
				-- 	end
				-- end,
			},
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "DiffviewClosed",
			callback = function()
				-- 1. Reset Gitsigns to default (local index)
				require("gitsigns").change_base(nil, true)

				-- 2. Notify the user
				Snacks.notify.warn("Review Mode Disabled: Gitsigns reset to default")
			end,
		})
	end,
}
