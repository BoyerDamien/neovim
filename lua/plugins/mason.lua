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
      "debugpy",


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
      "go-debug-adapter",

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
      "docker-compose-language-service",
      "dockerfile-language-server",

      -- Rust
      "rust-analyzer",
      "rustfmt"
    },
  },
}
