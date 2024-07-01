return {
  -- `hop` is an EasyMotion-like plugin allowing you to jump anywhere in a
  -- document with as few keystrokes as possible.
  {
    "smoka7/hop.nvim",
    version = "*",
    main = "hop",
    opts = {
      keys = "hklyuiopnm,qwertzxcvbasdgjf;",
    },
    keys = {
      {
        "<leader><leader>w",
        "<cmd>HopWord<cr>",
        mode = "",
        desc = "Hop to all words in the visible buffer; most useful!",
      },
      { "<leader><leader>l", "<cmd>HopLine<cr>", mode = "", desc = "Hop to the first column of each visible line" },
      {
        "<leader><leader>s",
        "<cmd>HopLineStart<cr>",
        mode = "",
        desc = "Hop to the first non-whitespace character of each line",
      },
    },
  },

  -- Register the `<leader>h` prefix as with a group name in which-key.
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader><leader>"] = { name = "+hop" },
      },
    },
  },
}
