local toggleTerm = require("toggleterm")

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    opts = {
      direction = "float",
      open_mapping = [[<C-`>]],
    },
    keys = {
      {
        "<leader>tv",
        function()
          local count = vim.v.count1
          toggleTerm.toggle(count, 0, vim.loop.cwd(), "vertical")
        end,
        desc = "ToggleTerm (vertical)",
      },
      {
        "<leader>th",
        function()
          local count = vim.v.count1
          toggleTerm.toggle(count, 10, vim.loop.cwd(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal)",
      },
    },
  },

  -- Register the `<leader>h` prefix as with a group name in which-key.
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>t"] = { name = "+ToggleTerm" },
      },
    },
  },
}
