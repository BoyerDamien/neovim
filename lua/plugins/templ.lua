return {
  "a-h/templ",
  ft = "templ",
  config = function()
    vim.filetype.add({
      extension = {
        templ = "templ",
      },
    })
  end,
}
