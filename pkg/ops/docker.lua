local term = require("pkg/terminal")
local cluster = require("pkg/ops/kubernetes")


function BuildDockerCommand(directory)
    local name =  cluster.Registry.address .. "/$(basename " .. directory .. "):latest"
    return "cd " .. directory .. " && make && docker build -t " .. name ..  " . && docker push " .. name
end


function DeployDockerImage(directory)
    term.RunNoAutoClose(
        "Docker", BuildDockerCommand(directory)
    )
end


function DeployAllDockerImages(baseDir)
    local bashCmd = "for path in $(ls -d " .. baseDir.."/*/); do " .. BuildDockerCommand("$path") .. "; done"
    term.RunNoAutoClose("Docker", bashCmd)
end


return {
    DeployDockerImage = DeployDockerImage,
    DeployAllDockerImages = DeployAllDockerImages
}
