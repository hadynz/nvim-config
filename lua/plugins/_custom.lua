return {
  -- Install plugins (with no config)
  { "smoka7/hop.nvim",   version = "2.7.0" },
  { "lbrayner/vim-rzip" }, -- Required for Yarn PnP
  { "stevearc/oil.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Disable Plugins
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  -- { "neovim/nvim-lspconfig", enabled = false },
  -- { "mason.nvim", enabled = false },
  -- { "mason-lspconfig.nvim", enabled = false },
  -- { "williamboman/mason.nvim", enabled = false },
}
