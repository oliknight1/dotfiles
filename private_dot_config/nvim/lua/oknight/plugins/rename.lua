return {
  "smjonas/inc-rename.nvim",
  opts = {},
  config = function(_, opts)
    vim.keymap.set("n", "<leader>rn", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true })
    vim.keymap.set("n", "<leader>rN", ":IncRename ")
    require("inc_rename").setup({
      input_buffer_type = "snacks",
    })
  end,
}
