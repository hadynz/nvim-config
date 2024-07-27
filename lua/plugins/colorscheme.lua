local set_dim_inactive = function(isEnabled)
  local cat = require("catppuccin")
  cat.options.dim_inactive.enabled = isEnabled
  cat.compile()
  vim.cmd.colorscheme(vim.g.colors_name)
end

return {
  {
    "catppuccin/nvim",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0, -- percentage of the shade to apply to the inactive window
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)

      -- Toggle dim inactive config on buffer/window change. Useful for making inactive
      -- buffers transparent (dimmed). Works well with TMUX panes as well
      vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FocusGained" }, {
        pattern = "*",
        callback = function()
          set_dim_inactive(true)
        end,
      })

      vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "FocusLost" }, {
        pattern = "*",
        callback = function()
          set_dim_inactive(false)
        end,
      })
    end,
  },

  -- Set catppuccin as default theme for LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "levouh/tint.nvim",
    keys = {
    },
    config = function(opts)
      local tint = require("tint")

      vim.api.nvim_create_autocmd({ "FocusGained" }, {
        pattern = "*",
        callback = function()
          tint.enable()
        end,
      })

      vim.api.nvim_create_autocmd({ "FocusLost" }, {
        pattern = "*",
        callback = function()
          tint.disable()
        end,
      })

      tint.setup({
        tint = -45, -- Darken colors, use a positive value to brighten
        saturation = 0.5, -- Saturation to preserve
      })
    end,
  },
}
