-- Plugins manager
local packer = require("packer")

-- Open packer in a floating window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

packer.startup(function(use)
    -- Packer package manager
    use("wbthomason/packer.nvim")

    -- Lspconfig
    require("plugins.lsp.init").setup(use)
    require("plugins.autocompletion.init").setup(use)

    --  UI
    use({
        require("plugins.theme").setup("onedarkWarm"),
        require("plugins.feline"),
        require("plugins.nvim_tree"),
        require("plugins.indentline"),
        {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        },
        {
            "glepnir/dashboard-nvim",
            event = "VimEnter",
            config = function()
                require("dashboard").setup({
                    -- config
                })
            end,
        },
        {
            "akinsho/bufferline.nvim",
            tag = "v3.*",
            requires = "nvim-tree/nvim-web-devicons",
            config = function()
                require("plugins/bufferline")
            end,
        },
        {
            "folke/which-key.nvim",
            config = function()
                require("plugins/which_key")
            end,
        },
        {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        },
        "voldikss/vim-floaterm",
        {
            "lewis6991/gitsigns.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("gitsigns").setup()
            end,
        },
    })

    -- Golang
    use({
        "ray-x/go.nvim",
        config = function()
            require("go").setup()
        end,
        requires = {
            "ray-x/guihua.lua",
        },
    })

    -- Testing
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",
        },
        config = function()
            require("plugins.testing").setup()
        end,
    })

    -- Debug
    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap", "folke/neodev.nvim", "theHamsta/nvim-dap-virtual-text" },
        config = function()
            require("plugins.debug.init").setup()
        end,
    })
end)
