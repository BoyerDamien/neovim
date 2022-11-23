local dependencies = {
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
	"williamboman/mason-lspconfig.nvim",
	    config = require("plugins.lsp.mason-lspconfig").setup(),
	},
	"mfussenegger/nvim-dap",
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.lsp.nullls").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true,
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins/treesitter")
		end,
	},
	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				height = 10,
				auto_open = false,
				auto_close = false,
				use_diagnostic_signs = true,
			})
		end,
	},
}

local m = {}

m.setup = function(use)
	for _, value in ipairs(dependencies) do
		use(value)
	end
end

return m
