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
        {
            'navarasu/onedark.nvim',
            config = function()
                require('onedark').setup({
                    style = "cool",
                    code_style = {
                        comments = 'italic',
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
            'feline-nvim/feline.nvim',
            config = function()
                local line_ok, feline = pcall(require, "feline")
                if not line_ok then
                    return
                end

                local one_monokai = {
                    fg = "#abb2bf",
                    bg = "#1e2024",
                    green = "#98c379",
                    yellow = "#e5c07b",
                    purple = "#c678dd",
                    orange = "#d19a66",
                    peanut = "#f6d5a4",
                    red = "#e06c75",
                    aqua = "#61afef",
                    darkblue = "#282c34",
                    dark_red = "#f75f5f",
                }

                local vi_mode_colors = {
                    NORMAL = "green",
                    OP = "green",
                    INSERT = "yellow",
                    VISUAL = "purple",
                    LINES = "orange",
                    BLOCK = "dark_red",
                    REPLACE = "red",
                    COMMAND = "aqua",
                }

                local c = {
                    vim_mode = {
                        provider = {
                            name = "vi_mode",
                            opts = {
                                show_mode_name = true,
                                -- padding = "center", -- Uncomment for extra padding.
                            },
                        },
                        hl = function()
                            return {
                                fg = require("feline.providers.vi_mode").get_mode_color(),
                                bg = "darkblue",
                                style = "bold",
                                name = "NeovimModeHLColor",
                            }
                        end,
                        left_sep = "block",
                        right_sep = "block",
                    },
                    gitBranch = {
                        provider = "git_branch",
                        hl = {
                            fg = "peanut",
                            bg = "darkblue",
                            style = "bold",
                        },
                        left_sep = "block",
                        right_sep = "block",
                    },
                    gitDiffAdded = {
                        provider = "git_diff_added",
                        hl = {
                            fg = "green",
                            bg = "darkblue",
                        },
                        left_sep = "block",
                        right_sep = "block",
                    },
                    gitDiffRemoved = {
                        provider = "git_diff_removed",
                        hl = {
                            fg = "red",
                            bg = "darkblue",
                        },
                        left_sep = "block",
                        right_sep = "block",
                    },
                    gitDiffChanged = {
                        provider = "git_diff_changed",
                        hl = {
                            fg = "fg",
                            bg = "darkblue",
                        },
                        left_sep = "block",
                        right_sep = "right_filled",
                    },
                    separator = {
                        provider = "",
                    },
                    fileinfo = {
                        provider = {
                            name = "file_info",
                            opts = {
                                type = "relative-short",
                            },
                        },
                        hl = {
                            style = "bold",
                        },
                        left_sep = " ",
                        right_sep = " ",
                    },
                    diagnostic_errors = {
                        provider = "diagnostic_errors",
                        hl = {
                            fg = "red",
                        },
                    },
                    diagnostic_warnings = {
                        provider = "diagnostic_warnings",
                        hl = {
                            fg = "yellow",
                        },
                    },
                    diagnostic_hints = {
                        provider = "diagnostic_hints",
                        hl = {
                            fg = "aqua",
                        },
                    },
                    diagnostic_info = {
                        provider = "diagnostic_info",
                    },
                    lsp_client_names = {
                        provider = "lsp_client_names",
                        hl = {
                            fg = "purple",
                            bg = "darkblue",
                            style = "bold",
                        },
                        left_sep = "left_filled",
                        right_sep = "block",
                    },
                    file_type = {
                        provider = {
                            name = "file_type",
                            opts = {
                                filetype_icon = true,
                                case = "titlecase",
                            },
                        },
                        hl = {
                            fg = "red",
                            bg = "darkblue",
                            style = "bold",
                        },
                        left_sep = "block",
                        right_sep = "block",
                    },
                    file_encoding = {
                        provider = "file_encoding",
                        hl = {
                            fg = "orange",
                            bg = "darkblue",
                            style = "italic",
                        },
                        left_sep = "block",
                        right_sep = "block",
                    },
                    position = {
                        provider = "position",
                        hl = {
                            fg = "green",
                            bg = "darkblue",
                            style = "bold",
                        },
                        left_sep = "block",
                        right_sep = "block",
                    },
                    line_percentage = {
                        provider = "line_percentage",
                        hl = {
                            fg = "aqua",
                            bg = "darkblue",
                            style = "bold",
                        },
                        left_sep = "block",
                        right_sep = "block",
                    },
                    scroll_bar = {
                        provider = "scroll_bar",
                        hl = {
                            fg = "yellow",
                            style = "bold",
                        },
                    },
                }

                local left = {
                    c.vim_mode,
                    c.gitBranch,
                    c.gitDiffAdded,
                    c.gitDiffRemoved,
                    c.gitDiffChanged,
                    c.separator,
                }

                local middle = {
                    c.fileinfo,
                    c.diagnostic_errors,
                    c.diagnostic_warnings,
                    c.diagnostic_info,
                    c.diagnostic_hints,
                }

                local right = {
                    c.lsp_client_names,
                    c.file_type,
                    c.file_encoding,
                    c.position,
                    c.line_percentage,
                    c.scroll_bar,
                }

                local components = {
                    active = {
                        left,
                        middle,
                        right,
                    },
                    inactive = {
                        left,
                        middle,
                        right,
                    },
                }

                feline.setup({
                    components = components,
                    theme = one_monokai,
                    vi_mode_colors = vi_mode_colors,
                })
                require('feline').winbar.setup()
            end
        },
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
