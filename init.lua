-- Setup package path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"

-- Relaod init.lua file on save

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerSync
    augroup end
]])

-- Plugins setup
require("plugins/init")

-- Key mapping setup
require("shortcuts")

-- Lsp config
-- require("lsp/init")

-- Neovim settings
require("settings")

-- Personal cmd
require("pkg/cmds")

-- Allow diagnostic signs
require("lspconfig.diagnostic_signs")
