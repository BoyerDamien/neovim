---------------------------------------------------------------------------------
--                              Utils commands
---------------------------------------------------------------------------------
--vim.api.nvim_command("command! -nargs=* Terminal lua require('pkg/utils').Terminal(<q-args>)")
vim.api.nvim_command("command! Terminal lua require('pkg/utils').Terminal()")
vim.api.nvim_command("command! LazyGit lua require('pkg/utils').LazyGit()")
vim.api.nvim_command("command! LazyDocker lua require('pkg/utils').LazyDocker()")
