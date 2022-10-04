local function SetupOneDark()
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

local themes = {
    onedark = SetupOneDark
}

local m = {}

function m.Setup(theme)
    themes[theme]()
end

return m
