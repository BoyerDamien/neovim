vim.g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" } --empty by default, don't auto open tree on specific filetypes.

vim.g.nvim_tree_git_hl = 1 --0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_root_folder_modifier = ":~" --This is the default. See :help filename-modifiers for more options

vim.g.nvim_tree_width_allow_resize = 0 --0 by default, will not resize the tree when opening a file

vim.g.nvim_tree_add_trailing = 1 --0 by default, append a trailing slash to folder names

vim.g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree

vim.g.nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE" } -- List of filenames that gets highlighted with NvimTreeSpecialFile


