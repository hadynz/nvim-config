local open_neogit = function()
  local lazyvimRoot = require("lazyvim.util.root")
  local cwd = lazyvimRoot.git()
  print(cwd)
  require("neogit").open({ cwd = cwd })
end

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },

    config = true,

    opts = {
      integrations = {
        telescope = true,
        diffview = true
      },
      popup = {
        kind = "floating"
      },
      commit_popup = {
        kind = "vsplit"
      }
    },

    keys = {
      { "<leader>gn", open_neogit, desc = "Open Neogit" },
    }
  }
}
