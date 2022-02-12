local leader = "<Space>"

-- Nvimtree
vim.api.nvim_set_keymap("n", leader .. "e", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", leader .. "r", "<CMD>NvimTreeRefresh<CR>", { noremap = true, silent = true })


-- Buffer line navigation
vim.api.nvim_set_keymap("n", "<Tab>", "<CMD>bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<CMD>bnext<CR>", { noremap = true, silent = true })


-- Telescope
vim.api.nvim_set_keymap("n", leader .. "f", "<CMD>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", leader .. "w", "<CMD>Telescope live_grep<CR>", { noremap = true, silent = true })


