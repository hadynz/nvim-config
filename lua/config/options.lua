-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Manually set Node path for lazy.nvim
-- vim.g.node_host_prog = '~/.nvm/versions/node/v20.10.0/lib/node_modules'
-- vim.g.copilot_node_command = '~/.nvm/versions/node/v20.10.0/bin/node'

local opt = vim.opt

-- Set listchars
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("tab:» ")
opt.listchars:append("trail:~")
