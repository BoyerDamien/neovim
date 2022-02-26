
function Run(title, ...)
    vim.api.nvim_command(":FloatermNew --name=" .. title .. " --title=" .. title .. " --autoclose=1 --width=0.8 --height=0.8 " .. ... )
end


function Term()
    Run("Terminal", "")
end

function LazyGit()
    Run("Lazygit", "lazygit")
end


function LazyDocker()
    Run("LazyDocker", "lazydocker")
end



return {
    Terminal = Term,
    LazyGit = LazyGit,
    LazyDocker = LazyDocker
}
