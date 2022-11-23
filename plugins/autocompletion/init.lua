local dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-nvim-lua",
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.autocompletion.nvim-cmp")
        end,
    },
    "onsails/lspkind-nvim",
    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autocompletion.autopairs")
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
