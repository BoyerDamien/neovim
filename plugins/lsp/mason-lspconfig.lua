local lsp_servers = {
	sumneko_lua = require("lspconfig.lua"),
	rust_analyzer = require("lspconfig.rust"),
	gopls = require("lspconfig.go"),
	yamlls = require("lspconfig.yaml"),
	clangd = {},
	cmake = {},
	cssls = {},
	dockerls = {},
	emmet_ls = {},
	html = {},
	jsonls = {},
	marksman = {},
	pyright = {},
	sqlls = {},
	tailwindcss = {},
	tsserver = {},
}

local function getServerList(server_table)
	local result = {}

	for key, _ in pairs(server_table) do
		table.insert(result, key)
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
