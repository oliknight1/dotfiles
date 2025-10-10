return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
      global_settings = {
        save_on_toggle = true,
      },
  },
  keys = {
    { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon add" },
    {
      "<leader>ho",
      function() 
        local h = require("harpoon")
        h.ui:toggle_quick_menu(h:list())
      end,
      desc = "Harpoon open list"
    },
    { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon select (1)" },
    { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon select (2)" },
    { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon select (3)" },
    { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon select (4)" },
    { "<leader>h5", function() require("harpoon"):list():select(5) end, desc = "Harpoon select (5)" },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon:setup(opts)
  end,

}
