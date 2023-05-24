return {
  "BoyerDamien/golang-code-actions.nvim",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim", "nvim-treesitter/nvim-treesitter"
  },
  build = "./install",
  config = function()
    require("golang-code-actions").setup()
  end
}
