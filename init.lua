-- Setup package path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvim/?.lua"

-- Plugins setup
require("plugins/init")


-- Key mapping setup
require("shortcuts")

-- Lsp config
require("lsp/init")


-- Vim settings
require("settings")
