local M = {}

M.start_pr_review = function()
	Snacks.picker.git_branches({
		confirm = function(picker, item)
			local branch = item.text

			-- 1. Close the picker UI first so it doesn't get "orphaned"
			picker:close()

			-- 2. Schedule the Diffview command to run immediately after the UI clears
			vim.schedule(function()
				-- Reset the mode to ensure the "text input" (Insert mode) is killed
				vim.cmd("stopinsert")

				-- Update Gitsigns base for your LSP stability
				require("gitsigns").change_base(branch, true)

				-- Launch Diffview with the branch you just picked
				vim.cmd("DiffviewOpen " .. branch .. " --imply-local")

				Snacks.notify.info("Opening Diffview for: " .. branch)
			end)
		end,
	})
end

return M

-- TODO: run the reset command on exit of diffview
-- find a way of manaually startung ts lsp
