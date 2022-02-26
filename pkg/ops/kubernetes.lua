local term = require("pkg/terminal")
local registry = {
    name = "local-registry",
    port = 58620,
    address = "0.0.0.0:58620",
    dns = "local-registry:58620"
}

function CreateCluster(name)
    local registryCmd = "k3d registry create -p " .. registry.port .. " " .. registry.name
    local clusterCmd = "k3d cluster create " .. name .. " --registry-use k3d-" .. registry.name .. ":58620"
    term.RunNoAutoClose(
        "Kubernetes", registryCmd .. " && " .. clusterCmd
    )
end

function DeleteCluster(name)
    local registryCmd = "k3d registry delete " .. registry.name
    local clusterCmd = "k3d cluster delete " .. name
    term.RunNoAutoClose("Kubernetes", clusterCmd .. " && " .. registryCmd)
end


function DeployHelmChart(path, name)
    local helmCmd = "helm install " .. name .. " " .. path
    local helmArgs = " --set image.repository=" .. registry.dns .. "/$(basename " .. path .. ") --set image.tag=latest"
    term.RunNoAutoClose("Kubernetes", helmCmd .. " " .. helmArgs)
end

function Inpsect()
    term.Run("Kubernetes", "k9s")
end


return {
    CreateCluster = CreateCluster,
    DeleteCluster = DeleteCluster,
    DeployHelmChart = DeployHelmChart,
    Inpsect = Inpsect,
    Registry = registry
}
