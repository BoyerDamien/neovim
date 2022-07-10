require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "go",
        "gomod",
        "comment",
        "cpp",
        "c",
        "rust",
        "json",
        "css",
        "dockerfile",
        "html",
        "markdown",
        "python",
        "javascript",
        "typescript",
        "yaml"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autopairs = { enable = true },
    -- List of parsers to ignore installing
    ignore_install = { "ocamllex", "teal", "devicetree", "godot_resource", "php" },
})
