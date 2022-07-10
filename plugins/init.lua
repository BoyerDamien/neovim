-- Plugins manager
local packer = require("packer")
local use = packer.use

packer.startup(function()

    -- Packer package manager
    use("wbthomason/packer.nvim")

    -- Lspconfig
    use {
        'neovim/nvim-lspconfig',
        {
            'williamboman/nvim-lsp-installer',
            config = function()
                require('nvim-lsp-installer').setup({
                    automatic_installation = true,
                })
            end
        },
        {
            "windwp/nvim-autopairs",
            config = function()
                require("plugins/autopairs")
            end
        },
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
        "onsails/lspkind-nvim",
        {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require('plugins/treesitter')
            end,
        },
        {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-vsnip',
                'hrsh7th/vim-vsnip',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/vim-vsnip-integ',
                {
                    "hrsh7th/cmp-nvim-lsp",
                    config = function()
                        require("plugins/nvim-cmp")
                    end,
                }
            },
        },
    }


    --  UI
    use {
        require("plugins.one_dark"),
        require("plugins.nvim_tree"),
        require("plugins.indentline"),
        require("plugins.lualine"),
        require("plugins.trouble"),
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
end)


