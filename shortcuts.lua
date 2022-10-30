local wk = require("which-key")

wk.register({
    t = {
        name = "Nvim tree",
        t = { "<CMD>NvimTreeToggle<CR>", "Toggle nvim tree" },
        r = { "<CMD>NvimTreeRefresh<CR>", "Refresh nvim tree" },
        e = { "<CMD>NvimTreeFocus<CR>", "Focus nvim tree" }
    },
    f = {
        name = "Files",
        f = { "<CMD>Telescope find_files<CR>", "Find files in workspace" },
        w = { "<CMD>Telescope live_grep<CR>", "Find word in files" },
        s = { "<CMD>write<CR>", "Save current file" },
        c = { "<CMD>bd<CR>", "Close current file" },
    },
    g = {
        name = "Git",
        l = { "<CMD>LazyGit<CR>", "Open LazyGit" },
        s = { "<CMD>Telescope git_status<CR>", "Show git status" },
        b = { "<CMD>Telescope git_branches<CR>", "Show git branches" },
        c = { "<CMD>Telescope git_commits<CR>", "Show git commits" },
        d = { "<CMD>Gitsigns diffthis<CR>", "Git diff" }
    },
    p = {
        name = "Packer",
        s = { "<CMD>PackerSync<CR>", "Sync packages" },
        c = { "<CMD>PackerCompile<CR>", "Compile packages" }
    }

}, { prefix = "<Space>" })

-- Buffer line navigation
vim.api.nvim_set_keymap("n", "<Tab>", "<CMD>bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<CMD>bnext<CR>", { noremap = true, silent = true })

-- Split pane navigation
vim.api.nvim_set_keymap("n", "<A-right>", "<CMD>wincmd l<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-left>", "<CMD>wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-up>", "<CMD>wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-down>", "<CMD>wincmd j<CR>", { noremap = true, silent = true })
