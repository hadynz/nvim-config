return {
  {
    "catppuccin/nvim",
    priority = 1000,
    opts = {
      flavour = "mocha",
    },
  },

  -- Set catppuccin as default theme for LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
