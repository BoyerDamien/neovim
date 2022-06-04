return {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("trouble").setup {
            height = 10,
            auto_open = true,
            auto_close = false,
            use_diagnostic_signs = true
        }
    end
}
