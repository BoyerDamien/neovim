return {
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
}
