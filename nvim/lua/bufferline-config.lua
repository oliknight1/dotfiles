require('bufferline').setup ({
	options = {
		numbers = "both",
		right_mouse_command = "bdelete! %d",
		max_name_length = 22,
		tab_size = 22,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = true,
		color_icons = true,
		show_buffer_icons = true,
		separator_style = "thin",
		always_show_bufferline = false,
		buffer_selected = {
			gui = "bold"
		},
		diagnostic_selected = {
			gui = "bold"
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left"
			}
		}

	}
})
