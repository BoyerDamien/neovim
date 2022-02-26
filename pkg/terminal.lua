function ToBash(cmd)
    return "bash -c '" .. cmd .. "'"
end


function Run(title, cmd)
    vim.api.nvim_command(
        ":FloatermNew --name=" .. title .. " --title=" .. title .. " --autoclose=1 --width=0.8 --height=0.8 " .. ToBash(cmd)
    )
end


function RunNoAutoClose(title, cmd)
    vim.api.nvim_command(
        ":FloatermNew --name=" .. title .. " --title=" .. title .. " --autoclose=0 --width=0.8 --height=0.8 " .. ToBash(cmd)
    )
end


function OpenTerminal(terminal)
    Run("Terminal", terminal)
end

return {
    Open = OpenTerminal,
    Run = Run,
    RunNoAutoClose = RunNoAutoClose,
}
