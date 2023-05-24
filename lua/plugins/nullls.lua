return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = true,
      sources = {

        -- Misspell
        -- Checks commonly misspelled English words in source files
        null_ls.builtins.diagnostics.misspell,

        -- Git

        -- Gitsigns
        -- Injects code actions for Git operations at the current cursor position
        -- (stage / preview / reset hunks, blame, etc.).
        null_ls.builtins.code_actions.gitsigns,

        -- Commitlint
        null_ls.builtins.diagnostics.commitlint,

        -- Go

        -- Gomodifytagsn
        -- Go tool to modify struct field tags
        null_ls.builtins.code_actions.gomodifytags,

        -- Golang ci lint
        -- A Go linter aggregator
        null_ls.builtins.diagnostics.golangci_lint,

        -- Impl
        -- Generates method stubs for implementing an interface
        null_ls.builtins.code_actions.impl,

        -- GoImports
        -- Enforce a stricter format than gofmt, while being backwards compatible.
        -- That is, gofumpt is happy with a subset of the formats that gofmt is happy with.
        null_ls.builtins.formatting.goimports,


        -- Makefile
        -- Checkmate
        -- Make linter
        null_ls.builtins.diagnostics.checkmake,

        -- Dotenv
        -- Linter
        null_ls.builtins.diagnostics.dotenv_linter,

        -- Json
        -- A pure JavaScript version of the service provided at jsonlint.com
        null_ls.builtins.diagnostics.jsonlint,

        -- Lua
        --  A tool for linting and static analysis of Lua code
        null_ls.builtins.diagnostics.luacheck,

        -- Markdown
        -- Markdown style and syntax checker
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.markdownlint,

        -- Python
        --
        -- Pylint is a Python static code analysis tool which looks for programming errors,
        -- helps enforcing a coding standard,
        -- sniffs for code smells and offers simple refactoring suggestions
        null_ls.builtins.diagnostics.pylint,

        -- Black
        -- The uncompromising Python code formatter
        null_ls.builtins.formatting.black,

        -- Isort
        -- Python utility / library to sort imports alphabetically
        -- and automatically separate them into sections and by type
        null_ls.builtins.formatting.isort,


        -- Pydocstyle
        -- Pydocstyle is a static analysis tool for checking compliance with Python docstring conventions
        null_ls.builtins.diagnostics.pydocstyle,



        -- OpenAPI
        -- A flexible JSON/YAML linter for creating automated style guides,
        -- with baked in support for OpenAPI v3.1, v3.0, and v2.0.
        null_ls.builtins.diagnostics.spectral,


        -- TODO comment
        -- Uses inbuilt Lua code and treesitter to detect lines with
        -- TODO comments and show a diagnostic warning on each line where it's present
        null_ls.builtins.diagnostics.todo_comments,

        -- SQL
        -- Formats your dbt SQL files so you don't have to
        null_ls.builtins.formatting.sqlfmt,

        -- Yaml
        null_ls.builtins.formatting.yamlfmt,

      },
      -- Regsiter custom code actions
      null_ls.register(
        {
          -- require("pkg.code_actions.golang.test.init"),
          require("pkg.code_actions.testing.init")
        }
      )
    })
  end,
}
