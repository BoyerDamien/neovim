return {
	cmd = { "lua-language-server" },
	on_attach = require("lsp/on_attach"),
	capabilities = require("lsp/capabilities"),
	settings = {
		Lua = {
			completion = {
				keywordSnippet = "Replace",
				callSnippet = "Replace",
			},
			runtime = {
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use", "love", "lua" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			hint = {
				enable = true,
			},
			intelliSense = {
				searchDepth = 4,
			},
			telemetry = {
				enable = false,
			},
		},
}}

