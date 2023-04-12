local m = {}

function m.setup(dap)
    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    -- Golang dap adapter with delve
    dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}" },
        },
    }

    dap.configurations.go = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}",
        },
        {
            type = "delve",
            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}",
        },
        -- works with go.mod packages and sub packages
        {
            type = "delve",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}",
        },
    }
    return dap
end

return m
