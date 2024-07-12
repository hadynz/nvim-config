local MiniFiles = require("mini.files")

-- Toggle visibility of mini.files explorer
local toggle_minifiles = function(...)
  if not MiniFiles.close() then
    MiniFiles.open(...)
  end
end

-- Predicate function to hide dot files
local filter_hide = function(fs_entry)
  return not vim.startswith(fs_entry.name, ".")
end

-- Auto command to add `g.` binding to toggle dot files
local toggle_dotfiles_visibility = function()
  local show_dotfiles = true

  local filter_show = function()
    return true
  end

  local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and filter_show or filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
  end

  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
      local buf_id = args.data.buf_id

      -- Tweak left-hand side of mapping to your liking
      vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
    end,
  })
end
toggle_dotfiles_visibility()

return {
  "echasnovski/mini.files",
  version = "*",
  opts = {
    content = {
      filter = filter_hide,
    },

    mappings = {
      close = "<Esc>",
      go_in_plus = "<CR>",
    },

    options = {
      use_as_default_explorer = true,
    },

    windows = {
      width_focus = 60,
      width_preview = 120,
    },
  },
  keys = {
    {
      "<leader>E",
      function()
        local lazyvimRoot = require("lazyvim.util.root")
        toggle_minifiles(lazyvimRoot.git(), true)
      end,
      desc = "Open mini.files (Git dir)",
    },
    {
      "<leader>e",
      function()
        toggle_minifiles(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (Cwd)",
    },
  },
}
