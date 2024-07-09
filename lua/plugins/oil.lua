return {
  {
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    opts = {
      float = {
        max_width = 100,
        max_height = 50,
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<Leader>m", ":Oil --float<CR>", mode = "", desc = "Open Oil" },
    },
  },
}
