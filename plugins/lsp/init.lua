local dependencies = {
    'neovim/nvim-lspconfig',
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = require("plugins.lsp.mason-lspconfig").setup()
    },
    "mfussenegger/nvim-dap",
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.lsp.nullls").setup()
        end
    }
}


local m = {}

m.setup = function(use)

    for _, value in ipairs(dependencies) do
        use(value)
    end
end


return m
