local m = {}
local null_ls = require("null-ls")

m.setup = function()
    require("null-ls").setup({
        sources = {
            -- Lua
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.diagnostics.luacheck,

            -- Javascript, typescript
            null_ls.builtins.diagnostics.eslint_d,
            null_ls.builtins.formatting.prettierd,

            -- Git
            null_ls.builtins.code_actions.gitsigns,

            --  Refactoring
            null_ls.builtins.code_actions.refactoring,

            -- Golang
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.diagnostics.golangci_lint,

            -- Rust
            null_ls.builtins.formatting.rustfmt,

            -- Markdown
            null_ls.builtins.diagnostics.markdownlint,
        },
    })
end

return m