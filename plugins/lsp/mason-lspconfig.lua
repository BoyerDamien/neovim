local lsp_servers = {
	{
		name = "lua_ls",
		cfg = require("lspconfig.lua"),
	},
	{
		name = "rust_analyzer",
		cfg = require("lspconfig.rust"),
	},
	{
		name = "gopls",
		cfg = require("lspconfig.go"),
	},
	{
		name = "yamlls",
		cfg = require("lspconfig.yaml"),
	},
	{
		name = "clangd",
		cfg = {},
	},
	{
		name = "cmake",
		cfg = {},
	},
	-- cmake = {},
	-- cssls = {},
	-- dockerls = {},
	-- emmet_ls = {},
	-- html = {},
	-- jsonls = {},
	-- marksman = {},
	-- pyright = {},
	-- sqls = require("lspconfig.sql"),
	-- tailwindcss = {},
	-- tsserver = {},
	-- bashls = {},
}

local function getServerList(server_table)
	local result = {}

	for _, server in pairs(server_table) do
		table.insert(result, server.name)
	end
	return result
end

local m = {}
local mason_lspconfig = require("mason-lspconfig")

m.setup = function()
	mason_lspconfig.setup({
		ensure_installed = getServerList(lsp_servers),
		automatic_installation = true,
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			local server_opt = lsp_servers[server_name]
			if server_opt ~= nil then
				server_opt.on_attach = require("plugins.lsp.on_attach")
				server_opt.capabilities = require("plugins.lsp.capabilities")
			else
				server_opt = {
					on_attach = require("plugins.lsp.on_attach"),
					capabilities = require("plugins.lsp.capabilities"),
				}
			end

			require("lspconfig")[server_name].setup(server_opt)
		end,
	})
end

return m
