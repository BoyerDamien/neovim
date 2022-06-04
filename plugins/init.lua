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
                -- setup with all defaults
                -- each of these are documented in `:help nvim-tree.OPTION_NAME`
                -- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
                require 'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
                    auto_reload_on_write = true,
                    create_in_closed_folder = false,
                    disable_netrw = false,
                    hijack_cursor = false,
                    hijack_netrw = true,
                    hijack_unnamed_buffer_when_opening = false,
                    ignore_buffer_on_setup = false,
                    open_on_setup = false,
                    open_on_setup_file = false,
                    open_on_tab = false,
                    sort_by = "name",
                    update_cwd = false,
                    reload_on_bufenter = false,
                    respect_buf_cwd = false,
                    view = {
                        adaptive_size = false,
                        width = 30,
                        height = 30,
                        hide_root_folder = false,
                        side = "left",
                        preserve_window_proportions = false,
                        number = false,
                        relativenumber = false,
                        signcolumn = "yes",
                        mappings = {
                            custom_only = false,
                            list = {
                                -- user mappings go here
                            },
                        },
                    },
                    renderer = {
                        add_trailing = true,
                        group_empty = false,
                        highlight_git = false,
                        highlight_opened_files = "none",
                        root_folder_modifier = ":~",
                        indent_markers = {
                            enable = false,
                            icons = {
                                corner = "└ ",
                                edge = "│ ",
                                none = "  ",
                            },
                        },
                        icons = {
                            webdev_colors = true,
                            git_placement = "before",
                            padding = " ",
                            symlink_arrow = " ➛ ",
                            show = {
                                file = true,
                                folder = true,
                                folder_arrow = true,
                                git = true,
                            },
                            glyphs = {
                                default = "",
                                symlink = "",
                                folder = {
                                    arrow_closed = "",
                                    arrow_open = "",
                                    default = "",
                                    open = "",
                                    empty = "",
                                    empty_open = "",
                                    symlink = "",
                                    symlink_open = "",
                                },
                                git = {
                                    unstaged = "✗",
                                    staged = "✓",
                                    unmerged = "",
                                    renamed = "➜",
                                    untracked = "★",
                                    deleted = "",
                                    ignored = "◌",
                                },
                            },
                        },
                        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
                    },
                    hijack_directories = {
                        enable = true,
                        auto_open = true,
                    },
                    update_focused_file = {
                        enable = false,
                        update_cwd = false,
                        ignore_list = {},
                    },
                    ignore_ft_on_setup = {},
                    system_open = {
                        cmd = "",
                        args = {},
                    },
                    diagnostics = {
                        enable = false,
                        show_on_dirs = false,
                        icons = {
                            hint = "",
                            info = "",
                            warning = "",
                            error = "",
                        },
                    },
                    filters = {
                        dotfiles = false,
                        custom = {},
                        exclude = {},
                    },
                    git = {
                        enable = true,
                        ignore = true,
                        timeout = 400,
                    },
                    actions = {
                        use_system_clipboard = true,
                        change_dir = {
                            enable = true,
                            global = false,
                            restrict_above_cwd = false,
                        },
                        expand_all = {
                            max_folder_discovery = 300,
                        },
                        open_file = {
                            quit_on_open = true,
                            resize_window = true,
                            window_picker = {
                                enable = true,
                                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                                exclude = {
                                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                                    buftype = { "nofile", "terminal", "help" },
                                },
                            },
                        },
                        remove_file = {
                            close_window = true,
                        },
                    },
                    trash = {
                        cmd = "trash",
                        require_confirm = true,
                    },
                    live_filter = {
                        prefix = "[FILTER]: ",
                        always_show_folders = true,
                    },
                    log = {
                        enable = false,
                        truncate = false,
                        types = {
                            all = false,
                            config = false,
                            copy_paste = false,
                            diagnostics = false,
                            git = false,
                            profile = false,
                        },
                    },
                } -- END_DEFAULT_OPTS
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
                    }
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
