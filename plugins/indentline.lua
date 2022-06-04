return {
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
}
