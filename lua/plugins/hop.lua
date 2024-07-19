local paste_at_char = function()
  local hop = require("hop-yank")
  hop.paste_char1({
    hint_offset = -1,
  })
end

local hop_end_of_word = function()
  local hop = require("hop")
  hop.hint_words({
    hint_position = require("hop.hint").HintPosition.END,
  })
end

return {
  -- `hop` is an EasyMotion-like plugin allowing you to jump anywhere in a
  -- document with as few keystrokes as possible.
  {
    "smoka7/hop.nvim",
    version = "*",
    main = "hop",
    opts = {
      multi_windows = true,
    },
    keys = {
      { "<leader><leader>w", "<cmd>HopCamelCase<cr>", desc = "Hop to word" },
      { "<leader><leader>e", hop_end_of_word, desc = "Hop to word ends" },
      { "<leader><leader>l", "<cmd>HopWordCurrentLine<cr>", desc = "Hop to word on current line" },
      { "<leader><leader>p", paste_at_char, desc = "Hop paste" },
      { "<leader><leader>n", "<cmd>HopNodes<cr>", desc = "Hop to tree node" },
      { "<leader><leader>s", "<cmd>HopLineStart<cr>", desc = "Hop to line start" },
      { "<leader><leader>/", "<cmd>HopPattern<cr>", desc = "Hop to pattern" },
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
