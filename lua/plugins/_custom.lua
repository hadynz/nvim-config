return {
  -- Install plugins (with no config)
  { "smoka7/hop.nvim", version = "2.7.0" },
  { "lbrayner/vim-rzip" }, -- Required for Yarn PnP
  { "linrongbin16/gitlinker.nvim", cmd = "GitLink", opts = {} }, -- Open git files remotely

  -- Disable Plugins
  { "nvim-neo-tree/neo-tree.nvim", enabled = false }, -- Replaced with mini.files
  { "akinsho/bufferline.nvim", enabled = false }, -- Disable buffer tabs
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
