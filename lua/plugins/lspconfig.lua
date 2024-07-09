return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          root_dir = function()
            local lazyvimRoot = require("lazyvim.util.root")
            return lazyvimRoot.git()
          end,
          settings = {
            typescript = {
              tsdk = ".yarn/sdks/typescript/lib",
            },
          },
          keys = {
            -- disable plugins.extra.lang.typescript default `gR` key
            { "gR", false },
          }
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- disable signature help showing in insert mode; conflicts with hjkl navigation in insert mode
      keys[#keys + 1] = { "<c-k>", false, mode = "i" }

      -- disable default `gr` key (references) that I want to override for rename
      keys[#keys + 1] = { "gr", false }
    end
  }
}
