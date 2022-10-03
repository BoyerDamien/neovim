return {
    "kyazdani42/nvim-tree.lua",
    requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
        local map_list = {
            { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "vsplit" },
            { key = "<C-e>", action = "edit_in_place" },
            { key = "O", action = "edit_no_picker" },
            { key = { "<C-]>", "<2-RightMouse>" }, action = "cd" },
            { key = "<C-v>", action = "vsplit" },
            { key = "<C-s>", action = "split" },
            { key = "<C-t>", action = "tabnew" },
            { key = "<", action = "prev_sibling" },
            { key = ">", action = "next_sibling" },
            { key = "P", action = "parent_node" },
            { key = "<BS>", action = "close_node" },
            { key = "<Tab>", action = "preview" },
            { key = "K", action = "first_sibling" },
            { key = "J", action = "last_sibling" },
            { key = "I", action = "toggle_git_ignored" },
            { key = "H", action = "toggle_dotfiles" },
            { key = "U", action = "toggle_custom" },
            { key = "R", action = "refresh" },
            { key = "a", action = "create" },
            { key = "d", action = "remove" },
            { key = "D", action = "trash" },
            { key = "r", action = "rename" },
            { key = "<C-r>", action = "full_rename" },
            { key = "x", action = "cut" },
            { key = "c", action = "copy" },
            { key = "p", action = "paste" },
            { key = "y", action = "copy_name" },
            { key = "Y", action = "copy_path" },
            { key = "gy", action = "copy_absolute_path" },
            { key = "[e", action = "prev_diag_item" },
            { key = "[c", action = "prev_git_item" },
            { key = "]e", action = "next_diag_item" },
            { key = "]c", action = "next_git_item" },
            { key = "-", action = "dir_up" },
            { key = "s", action = "system_open" },
            { key = "f", action = "live_filter" },
            { key = "F", action = "clear_live_filter" },
            { key = "q", action = "close" },
            { key = "W", action = "collapse_all" },
            { key = "E", action = "expand_all" },
            { key = "S", action = "search_node" },
            { key = ".", action = "run_file_command" },
            { key = "<C-k>", action = "toggle_file_info" },
            { key = "g?", action = "toggle_help" },
            { key = "m", action = "toggle_mark" },
            { key = "bmv", action = "bulk_move" },
        }

        -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded = 1
        vim.g.loaded_netrwPlugin = 1

        -- OR setup with some options
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                adaptive_size = true,
                mappings = {
                    list = map_list
                },
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
    end,
}
