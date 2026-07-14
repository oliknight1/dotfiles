return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"giuxtaposition/blink-cmp-copilot",
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			cmdline = {
				keymap = {
					preset = "inherit",
				},

				completion = {
					menu = {
						auto_show = true,
					},
				},
			},
			keymap = {
				preset = "super-tab",
				["<C-a>"] = { "show", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
				kind_icons = {
					Copilot = "", -- The icon on the LEFT
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},
			completion = {
				menu = {
					min_width = 20,
					border = "rounded",
					draw = {
						-- We don't need label_description now because label and label_description are already
						-- combined together in label by colorful-menu.nvim.
						columns = {
							{
								"kind_icon",
							},
							{
								"label",
								gap = 1,
							},
						},
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},

				documentation = {
					auto_show = true,
					window = { border = "rounded" },
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
						transform_items = function(_, items)
							for _, item in ipairs(items) do
								item.kind = "Copilot"
							end

							return items
						end,
					},
				},
			},
		},

		opts_extend = { "sources.default" },
	},
}
