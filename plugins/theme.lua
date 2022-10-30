local onedark_code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'bold',
    strings = 'none',
    variables = 'none'
}

local themeList = {

    onedark = {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup({
                style = "cool",
                code_style = onedark_code_style,
            })
            require('onedark').load()
        end
    },
    onedarkWarm = {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup({
                style = "warm",
                code_style = onedark_code_style
            })
            require('onedark').load()
        end
    },
}

local m = {}

m.setup = function(theme)
    if themeList[theme] ~= nil then
        return themeList[theme]
    end
    error("unknown theme", 1)
end

return m
