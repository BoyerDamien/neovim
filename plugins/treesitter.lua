require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autopairs = { enable = true },
    -- List of parsers to ignore installing
    ignore_install = { "ocamllex", "teal", "devicetree", "godot_resource" },
})
