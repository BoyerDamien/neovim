return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "commitlint",

      -- Python
      "black",
      "isort",
      "pylint",
      "pyright",
      "pydocstyle",


      -- Json
      "jsonlint",
      "json-lsp",

      -- Golang
      "gopls",
      "gomodifytags",
      "golangci-lint",
      "impl",
      "goimports",
      "delve",

      -- Lua
      "lua-language-server",
      "luacheck",
      "stylua",



      -- Markdown
      "markdownlint",
      "misspell",


      -- Bash
      "shfmt",

      -- OpenAPI
      "spectral-language-server",

      -- Yaml
      "yaml-language-server",
      "yamlfmt",

      -- Sql
      "sqlls",
      "sqlfmt",

      -- Docker
      "hadolint",
      "docker-compose-language-service",
      "dockerfile-language-server",
    },
  },
}
