-- Plugins manager
require("packer").startup(function()

    -- Packer package manager
    use("wbthomason/packer.nvim")

    -- File explorer
    use {
        {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons", -- optional, for file icon
            },
            config = function()
                require("plugins/nvim_tree")
                require("nvim-tree").setup({
                    actions = {
                        open_file = {
                            quit_on_open = true,
                            resize_window = false,
                            window_picker = {
                                enable = true,
                                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                                exclude = {
                                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
                                    buftype  = { "nofile", "terminal", "help", },
                                }
                            }
                        }
                    } })
            end,
        },
        {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        },
    }

    -- UI
    use {
        {
            'glepnir/dashboard-nvim',
            config = function()
                vim.g.dashboard_default_executive = 'telescope'
            end,
        },
        {
            'navarasu/onedark.nvim',
            config = function()
                require('onedark').setup({
                    style = "cool",
                    code_style = {
                        comments = 'italic,underline',
                        keywords = 'none',
                        functions = 'bold',
                        strings = 'none',
                        variables = 'none'
                    },
                })
                require('onedark').load()
            end
        },
        {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require('lualine').setup {
                    options = {
                        theme = 'onedark',
                        section_separators = { left = '', right = '' },
                        component_separators = { left = '', right = '' }
                    },
                    sections = {
                        lualine_a = { 'mode' },
                        lualine_b = { 'branch', 'diff', 'diagnostics' },
                        lualine_c = { 'windows' },
                        lualine_x = { 'fileformat', 'filetype' },
                        lualine_y = { 'progress' },
                        lualine_z = { 'location' }
                    },
                }
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
            'lukas-reineke/indent-blankline.nvim',
            branch = 'master',
            config = function()
                require("indent_blankline").setup {
                    show_current_context = true,
                    buftype_exclude = { "terminal" },
                    use_treesitter = true,
                    bufname_exclude = { "dashboard" },
                }
            end
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
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {
                    height = 10,
                    auto_open = true,
                    auto_close = true,
                    use_diagnostic_signs = true
                }
            end
        }
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
