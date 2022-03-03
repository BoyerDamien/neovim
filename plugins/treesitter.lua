require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = { enable = true },
	autopairs = { enable = true },
      -- List of parsers to ignore installing
    ignore_install = { "ocamllex", "teal", "devicetree", "godot_resource" },
})
