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
