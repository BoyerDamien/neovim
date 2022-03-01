local term = require("pkg/terminal")
local registry = {
    name = "local-registry",
    port = "58620",
    address = "0.0.0.0:58620",
    dns = "local-registry:58620"
}

function CreateCluster(name)
    local registryCmd = "k3d registry create -p " .. registry.port .. " " .. registry.name
    local clusterCmd = "k3d cluster create " .. name .. " --registry-use k3d-" .. registry.dns
    term.RunNoAutoClose(
        "Kubernetes", registryCmd .. " && " .. clusterCmd
    )
end

function DeleteCluster(name)
    local registryCmd = "k3d registry delete " .. registry.name
    local clusterCmd = "k3d cluster delete " .. name
    term.RunNoAutoClose("Kubernetes", clusterCmd .. " && " .. registryCmd)
end


function BuildHelmChart(path, name)
    local helmCmd = "helm install " .. name .. " " .. path
    local helmArgs = " --set image.repository=k3d-" .. registry.dns .. "/$(basename " .. path .. ") --set image.tag=latest"
    return helmCmd .. " " .. helmArgs
end

function DeployHelmChart(path, name)
    term.RunNoAutoClose("Kubernetes", BuildHelmChart(path, name))
end


function DeployAllHelmCharts(baseDir)
    local name = "$(basename $path)"
    local path = "$path/k8s/" .. name
    local bashCmd = "for path in $(ls -d " .. baseDir.."/*/); do " .. BuildHelmChart(path, name) .. "; done"
    term.RunNoAutoClose("Kubernetes", bashCmd)
end



function Inpsect()
    term.Run("Kubernetes", "k9s")
end


return {
    CreateCluster = CreateCluster,
    DeleteCluster = DeleteCluster,
    DeployHelmChart = DeployHelmChart,
    DeployAllHelmCharts = DeployAllHelmCharts,
    Inpsect = Inpsect,
    Registry = registry
}
