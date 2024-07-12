-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local telescope_builtin_utils = require("telescope.builtin")
local map = LazyVim.safe_keymap_set

-- Redo
map("n", "U", "<C-r>", { desc = "Redo" })

-- Navigate back and forth
map("n", "<C-[>", "<C-o>", { desc = "Navigate back" })
map("n", "<C-]>", "<C-i>", { desc = "Navigate forward" })

-- Using change without yank
map({ "n", "v" }, "c", '"_c', { desc = "Change without yank" })
map({ "n", "v" }, "C", '"_C', { desc = "Change without yank" })

-- Using delete without yank
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })

-- Clear highlight of search, messages, floating windows
map({ "n", "i" }, "<Esc>", function()
  vim.cmd([[nohl]])                                 -- clear highlight of search
  vim.cmd([[stopinsert]])                           -- clear messages (the line below statusline)
  for _, win in ipairs(vim.api.nvim_list_wins()) do -- clear all floating windows
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Clear aigalight of search, messages, floating windows" })

-- Keep cursor centered when navigating
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered" })
map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centered" })

-- Mapping for dd that doesn't yank an empty line into your default register:
map("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { expr = true })

-- Console Log snippet
map("i", "cll", "console.log();<ESC>F(a", { desc = "Paste console log snippet" })
map("n", "cll", "yiw%ocll'<Esc>pwa, <Esc>p3b", { desc = "Copy current work and paste console log snippet" })

-- Yank History Picker
map("n", "<Leader>p", ":YankHistory<CR>", { desc = "Yank History Picker" })
map("i", "<C-r>p", require("telescope").extensions.yank_history.yank_history, { desc = "Yank History Picker" })

-- HJKL insert mode navigation
map("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
map("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
map("i", "<C-k>", "<Up>", { desc = "Move cursor up" })
map("i", "<C-l>", "<Right>", { desc = "Move cursor right" })

-- Space W to save file
map("n", "<Space>w", ":w<CR>", { desc = "Save file" })
map("n", "<Space>q", ":q<CR>", { desc = "Quit buffer" })

-- LSP keymaps
map("n", "ga", vim.lsp.buf.code_action, { desc = "Code action" })
-- map("n", "gr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "gR", telescope_builtin_utils.lsp_references, { desc = "Find all references" })
map("n", "gh", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
map("n", "go", LazyVim.lsp.action["source.organizeImports"], { desc = "Format" })
map("n", "==", vim.lsp.buf.format, { desc = "Format" })

-- Git
map("n", "gb", "<cmd>GitLink! default_branch<CR>", { desc = "Open Remote File (main)" })
map("n", "gB", "<cmd>GitLink!<CR>", { desc = "Open Remote File" })
map("n", "<Leader>gB", "<cmd>GitLink! blame<CR>", { desc = "Open Remote File with Blame" })

-- Before/After
map("n", "[o", "m`O<esc>d0x``", { desc = "Empty line above" })        -- new line before
map("n", "]o", "m`o<esc>d0x``", { desc = "Empty line below" })        -- new line after
map("n", "<Leader>O", "m`O<esc>d0x``", { desc = "Empty line above" }) -- new line before
map("n", "<Leader>o", "m`o<esc>d0x``", { desc = "Empty line below" }) -- new line after
map("n", "[p", "m`P``", { desc = "Paste before" })                    -- paste before

-- Telescope
map("n", "<C-p>", telescope_builtin_utils.git_files, { desc = "Find File" }) -- iTerm maps Cmd+p to Ctrl+p
map("n", "<Leader>a", telescope_builtin_utils.commands, { desc = "Find Action" })
-- map("n", "<Leader>r", telescope_builtin_utils.oldfiles, { desc = "Recent Files" })

-- Copy File Path
local copy_file_path = function(path)
  vim.fn.setreg("+", path)
  vim.notify("Copied relative file path to clipboard: " .. path)
end

local resolve_file_path = function()
  local choice_callback = function(_choice, index)
    local path = index == 1 and vim.fn.expand("%") or vim.fn.expand("%:p")
    copy_file_path(path)
  end
  vim.ui.select({ "Copy relative file path", "Copy absolute file path" }, { prompt = "Copy File Path" }, choice_callback)
end
map("n", "<Leader>yf", resolve_file_path, { desc = "Copy File Path" })

-- nmap gA :action InspectCode<cr>
-- nmap gA :action InspectCode<cr>
-- nmap gA :action InspectCode<cr>
-- nmap gA :action InspectCode<cr>
-- " editor actions
-- nmap gA :action InspectCode<cr>
-- nmap gi :action GotoImplementation<cr>
-- nmap gd :action GotoDeclaration<cr>
-- nmap gj :action RunContextGroup<cr>
-- nmap gJ :action ChooseRunConfiguration<cr>
-- nmap gr :action Refactorings.QuickListPopupAction<cr>
-- nmap gR :action FindUsagesMenuGroup<cr>
-- nmap gs :action FileStructurePopup<cr>
-- nmap gp :action SelectInProjectView<cr>
-- nmap gb :action SelectIn<cr>
-- nmap gh :action QuickJavaDoc<cr>
-- nmap ge :action ShowErrorDescription<cr>
-- nmap gH :action ShowErrorDescription<cr>
-- nmap gt :action GotoTest<cr>
-- nmap gf :action CollapseRegion<cr>
-- nmap gF :action ExpandAllToLevel1<cr>
-- nmap ge :action ExpandRegion<cr>
-- nmap gE :action ExpandAllRegions<cr>
--
-- " Quick global IDE commands
-- nnoremap <Leader>/ :action FindInPath<cr>
-- nmap <leader>b :action ToggleLineBreakpoint<cr>
-- nmap <leader>x :action HideAllWindows<cr>
-- nmap <leader>a :action GotoAction<cr>
-- nmap <leader>r :action RecentFiles<cr>
-- nmap <leader>R :action RecentLocations<cr>
-- nmap <leader>j :action FileStructurePopup<cr>
--
-- " code formatting
-- nmap == :action ReformatCode<cr>
-- nmap go :action OptimizeImports<cr>
