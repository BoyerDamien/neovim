local lsp_installer_servers = require('nvim-lsp-installer.servers')
local lsp_installer = require('nvim-lsp-installer')

-- Allow diagnostic signs
require("lsp/diagnostic_signs")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local servers = {
    {
        name = "pyright",
        opt = {}
    },
    {
        name = "gopls",
        opt = require("lsp/go")
    },
    {
        name = "golangci_lint_ls",
        opt = {}
    },
    {
        name = "sumneko_lua",
        opt = require("lsp/lua")
    },
    {
        name = "yamlls",
        opt = require("lsp/yaml")
    },
    {
        name = "rust_analyzer",
        opt = require("lsp.rust")
    },
    {
        name = "clangd",
        opt = {}
    },
    {
        name = "tsserver",
        opt = {}
    },
    {
        name = "spectral" ,
        opt = {}
    },
    {
        name = "jsonls",
        opt = {}
    }
}

-- Loop through the servers listed above and set them up. If a server is
-- not already installed, install it.
for _, server_opt in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_opt.name)
    if server_available then
        server:on_ready(function ()
            server_opt.opt.capabilities = require("lsp.capabilities")
            server_opt.opt.on_attach = require("lsp.on_attach")
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to also use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up your servers, because by doing so you'd be setting up the same server twice.
            server:setup(server_opt.opt)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end


