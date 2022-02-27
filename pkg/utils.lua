local term = require("pkg/terminal")

function LazyGit()
    term.Run("Lazygit", "lazygit")
end


function LazyDocker()
    term.Run("LazyDocker", "lazydocker")
end

return {
    LazyGit = LazyGit,
    LazyDocker = LazyDocker,
}
