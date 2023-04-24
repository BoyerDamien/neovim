return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { 'nvim-treesitter/playground' },
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
      "go",
      "rust",
    })
  end,
}
