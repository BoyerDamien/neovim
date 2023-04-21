-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Buffer line navigation
vim.api.nvim_set_keymap("n", "<Tab>", "<CMD>bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<CMD>bnext<CR>", { noremap = true, silent = true })

-- Split pane navigation
vim.api.nvim_set_keymap("n", "<A-right>", "<CMD>wincmd l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-left>", "<CMD>wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-up>", "<CMD>wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-down>", "<CMD>wincmd j<CR>", { noremap = true, silent = true })

-- Testing
vim.api.nvim_command("command! TestFunc lua require('pkg.testing').TestFunc()")
vim.api.nvim_command("command! TestProject lua require('pkg.testing').TestProject()")
vim.api.nvim_command("command! TestFile lua require('pkg.testing').TestFile()")
vim.api.nvim_command("command! TestOutput lua require('pkg.testing').TestOutput()")
vim.api.nvim_command("command! TestClose lua require('pkg.testing').TestClose()")
vim.api.nvim_command("command! TestOpen lua require('pkg.testing').TestOpen()")
