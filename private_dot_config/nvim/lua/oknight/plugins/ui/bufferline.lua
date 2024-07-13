-- return {
--   "akinsho/bufferline.nvim",
--   event = "VeryLazy",
--   keys = {
--     { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
--     { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
--     { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
--     { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
--     { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
--     { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
--     { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
--     { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
--     { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
--     { "<leader>1",  "<cmd>BufferLineGoToBuffer 1<cr>",         desc = "Go to buffer 1" },
--     { "<leader>2",  "<cmd>BufferLineGoToBuffer 2<cr>",         desc = "Go to buffer 2" },
--     { "<leader>3",  "<cmd>BufferLineGoToBuffer 3<cr>",         desc = "Go to buffer 3" },
--     { "<leader>4",  "<cmd>BufferLineGoToBuffer 4<cr>",         desc = "Go to buffer 4" },
--     { "<leader>5",  "<cmd>BufferLineGoToBuffer 5<cr>",         desc = "Go to buffer 5" },
--     { "<leader>6",  "<cmd>BufferLineGoToBuffer 6<cr>",         desc = "Go to buffer 6" },
--     { "<leader>7",  "<cmd>BufferLineGoToBuffer 7<cr>",         desc = "Go to buffer 7" },
--     { "<leader>8",  "<cmd>BufferLineGoToBuffer 8<cr>",         desc = "Go to buffer 8" },
--     { "<leader>9",  "<cmd>BufferLineGoToBuffer 9<cr>",         desc = "Go to buffer 9" },
--   },
--   opts = {
--     options = {
--       numbers = 'ordinal',
--       -- stylua: ignore
--       close_command = function(n) require("mini.bufremove").delete(n, false) end,
--       -- stylua: ignore
--       right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
--       diagnostics = "nvim_lsp",
--       always_show_bufferline = false,
--       offsets = {
--         {
--           filetype = "neo-tree",
--           text = "Neo-tree",
--           highlight = "Directory",
--           text_align = "left",
--         },
--       },
--     },
--   },
--   config = function(_, opts)
--     require("bufferline").setup(opts)
--     -- Fix bufferline when restoring a session
--     vim.api.nvim_create_autocmd("BufAdd", {
--       callback = function()
--         vim.schedule(function()
--           pcall(nvim_bufferline)
--         end)
--       end,
--     })
--   end,
-- }
return {}
