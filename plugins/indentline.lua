return {
    "lukas-reineke/indent-blankline.nvim",
    branch = "master",
    config = function()
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = true,
            buftype_exclude = { "terminal" },
            use_treesitter = true,
            bufname_exclude = { "dashboard", "dashboard-1" },
            show_end_of_line = true,
        })
    end,
}
