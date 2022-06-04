-- Plugins manager
require("packer").startup(function()

    -- Packer package manager
    use("wbthomason/packer.nvim")

    -- File explorer
    use {
        require("plugins.nvim_tree"),
        {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        },
    }

    -- UI
    use {
        require("plugins.one_dark"),
        require("plugins.lualine"),
        require("plugins.trouble"),
        require("plugins.indentline"),
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
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        },
        use {
            'voldikss/vim-floaterm',
        },
    }

    -- Completion
    use {
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
        {
            "tzachar/cmp-tabnine",
            run = "./install.sh",
            requires = "hrsh7th/nvim-cmp"
        },

    }

    -- Lspconfig
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        {
            "windwp/nvim-autopairs",
            config = function()
                require("plugins/autopairs")
            end
        },
        "ray-x/lsp_signature.nvim",
        "onsails/lspkind-nvim",
        {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require('plugins/treesitter')
            end,
        },
    }
    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Golang
    use {
        "ray-x/go.nvim",
        run = ":GoInstallBinaries",
        config = function()
            require("go").setup()
        end,
    }

end)
