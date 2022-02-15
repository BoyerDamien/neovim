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
				require("nvim-tree").setup({})
			end,
		},
		{
			"nvim-telescope/telescope.nvim",
			requires = {  "nvim-lua/popup.nvim" ,  "nvim-lua/plenary.nvim"  },
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
			'folke/tokyonight.nvim',
			config = function()
				vim.cmd[[colorscheme tokyonight]]
			end,
		},
		{
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('lualine').setup {
					options = {
						theme = 'tokyonight'
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
			'folke/trouble.nvim',
			requires = "kyazdani42/nvim-web-devicons",
  			config = function()
    				require("trouble").setup()
  			end
		},
        {
            'folke/which-key.nvim',
            config=function ()
                require("plugins/which_key")
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
			config=function ()
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
		'f-person/git-blame.nvim',
		'kdheepak/lazygit.nvim',
	}

	-- Golang
	use {
			"ray-x/go.nvim",
			run=":GoInstallBinaries",
			config = function()
				require("go").setup()
			end,

	}
end)
