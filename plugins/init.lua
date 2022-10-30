-- Plugins manager

require("packer").startup(function(use)

    -- Packer package manager
    use("wbthomason/packer.nvim")

    -- Lspconfig
    --
    require("plugins.lsp.init").setup(use)
    use {
        -- 'neovim/nvim-lspconfig',
        -- {
        --     'williamboman/nvim-lsp-installer',
        --     config = function()
        --         require('nvim-lsp-installer').setup({
        --             automatic_installation = true,
        --         })
        --     end
        -- },
        {
            "ray-x/lsp_signature.nvim",
            config = function()
                require('lsp_signature').setup({
                    bind = true,
                    handler_opts = {
                        border = "rounded"
                    }
                })
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require('plugins/treesitter')
            end,
        },

        require("plugins.autocompletion.init").setup(use)
    }

    --  UI
    use {
        require("plugins.theme").setup("onedarkWarm"),
        require("plugins.feline"),
        require("plugins.nvim_tree"),
        require("plugins.indentline"),
        {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        },
        {
            'glepnir/dashboard-nvim',
            config = function()
                vim.g.dashboard_default_executive = 'telescope'
            end,
        },
        {
            'akinsho/bufferline.nvim',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require('plugins/bufferline')
            end,
        },
        {
            'folke/which-key.nvim',
            config = function()
                require("plugins/which_key")
            end
        },
        {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        },
        'voldikss/vim-floaterm',
        {
            'lewis6991/gitsigns.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require('gitsigns').setup()
            end
        }
    }

    -- Golang
    use {
        {
            'ray-x/go.nvim',
            config = function()
                require("go").setup()
            end
        },
        'ray-x/guihua.lua'
    }
end)
