return {
	"echasnovski/mini.surround",
	keys = function(_, keys)
		-- Populate the keys based on the user's options
		local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
		local opts = require("lazy.core.plugin").values(plugin, "opts", false)
		local mappings = {
			{ opts.mappings.add, desc = "Surround: add (motion + char after this keybind)", mode = { "n", "v" } },
			{ opts.mappings.delete, desc = "Surround: delete" },
			{ opts.mappings.find, desc = "Surround: find next" },
			{ opts.mappings.find_left, desc = "Surround: find prev" },
			{ opts.mappings.highlight, desc = "Surround: highlight" },
			{ opts.mappings.replace, desc = "Surround: change" },
			{ opts.mappings.update_n_lines, desc = "Surround: update search range" },
		}
		mappings = vim.tbl_filter(function(m)
			return m[1] and #m[1] > 0
		end, mappings)
		return vim.list_extend(mappings, keys)
	end,
	opts = {
		mappings = {
			add = "<leader>sa", -- motion + char to wrap
			delete = "<leader>sd", -- remove surrounding pair
			find = "<leader>sf", -- jump to next surrounding
			find_left = "<leader>sF", -- jump to prev surrounding
			highlight = "<leader>sh", -- highlight surrounding pair
			replace = "<leader>sc", -- change surrounding char
			update_n_lines = "<leader>sn", -- expand multi-line search range
		},
	},
}
