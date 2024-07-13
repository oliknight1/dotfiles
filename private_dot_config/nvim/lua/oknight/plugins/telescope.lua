return {
	"nvim-telescope/telescope.nvim",
	version = false, -- telescope did only one release, so use HEAD for now
	lazy = false,
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			enabled = vim.fn.executable("make") == 1,
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
			config = function()
				require("telescope").load_extension("live_grep_args")
			end,
		},
		"Myzel394/jsonfly.nvim",
		{
			"Myzel394/jsonfly.nvim",
		},
	},
	keys = {
		{
			"<leader>j",
			"<cmd>Telescope jsonfly<cr>",
			desc = "Open json(fly)",
			ft = { "json" },
			mode = "n",
		},
		{
			"<leader>,",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
			desc = "Switch Buffer",
		},
		-- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		-- -- find
		{
			"<leader>/",
			"<cmd>lua require('telescope.builtin').live_grep{ path_display = { 'smart' } }<cr>",
			desc = "Grep args (root dir)",
		},
		-- { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
		{
			"<leader>f",
			"<cmd>lua require('telescope.builtin').find_files{ path_display = { 'smart' } }<cr>",
			desc = "Find Files (root dir)",
		},
		{ "<leader>o", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
		-- { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
		-- search
		{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
		{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
		-- {
		--   "<leader>ss",
		--   function()
		--     require("telescope.builtin").lsp_document_symbols({
		--       symbols = require("lazyvim.config").get_kind_filter(),
		--     })
		--   end,
		--   desc = "Goto Symbol",
		-- },
		-- {
		--   "<leader>sS",
		--   function()
		--     require("telescope.builtin").lsp_dynamic_workspace_symbols({
		--       symbols = require("lazyvim.config").get_kind_filter(),
		--     })
		--   end,
		--   desc = "Goto Symbol (Workspace)",
		-- },
	},
	opts = function()
		local actions = require("telescope.actions")

		local open_with_trouble = function(...)
			return require("trouble.providers.telescope").open_with_trouble(...)
		end
		local open_selected_with_trouble = function(...)
			return require("trouble.providers.telescope").open_selected_with_trouble(...)
		end
		-- local find_files_no_ignore = function()
		--   local action_state = require("telescope.actions.state")
		--   local line = action_state.get_current_line()
		--   Util.telescope("find_files", { no_ignore = true, default_text = line })()
		-- end
		-- local find_files_with_hidden = function()
		--   local action_state = require("telescope.actions.state")
		--   local line = action_state.get_current_line()
		--   Util.telescope("find_files", { hidden = true, default_text = line })()
		-- end

		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				-- open files in the first window that is an actual file.
				-- use the current window if no other window is available.
				get_selection_window = function()
					local wins = vim.api.nvim_list_wins()
					table.insert(wins, 1, vim.api.nvim_get_current_win())
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].buftype == "" then
							return win
						end
					end
					return 0
				end,
				mappings = {
					i = {
						["<c-t>"] = open_with_trouble,
						["<a-t>"] = open_selected_with_trouble,
						-- ["<a-i>"] = find_files_no_ignore,
						-- ["<a-h>"] = find_files_with_hidden,
						["<C-Down>"] = actions.cycle_history_next,
						["<C-Up>"] = actions.cycle_history_prev,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
				},
				pickers = {
					diagnostics = {
						previewer = false,
					},
					live_grep = {
						path_display = { "tail" },
					},
					find_files = {
						-- path_display = { "smart" },
						path_display = { "tail" },
					},
					live_grep_args = {
						path_display = { "smart" },
					},
					oldfiles = {
						path_display = { "tail" },
					},
				},
			},
			extensions = {
				jsonfly = {
					subkeys_display = "waterfall",
					mirror = true,
					layout_strategy = "vertical",
					layout_config = {
						mirror = true,
						preview_height = 0.75,
						prompt_position = "top",
					},
					key_exact_length = true,
				},
			},
		}
	end,
}
