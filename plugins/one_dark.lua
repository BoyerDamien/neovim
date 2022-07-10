return {
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
}
