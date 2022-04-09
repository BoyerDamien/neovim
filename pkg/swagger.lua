local terminal = require("pkg.terminal")
local containerName = "swagger-preview"

function Preview(path)
    local dockerCommand = "docker run --name " .. containerName .. " -d --rm -p 80:8080 -e BASE_URL=/swagger -e SWAGGER_JSON=" .. path .. " -v" .. path .. ":/" .. path .. " swaggerapi/swagger-ui"
    terminal.Run("SwaggerPreview",dockerCommand .. " && sleep 2 && open http://localhost/swagger")
end

function StopPreview()
    terminal.Run("StopSwaggerPreview", "docker stop " ..containerName)
end

function Show()
    terminal.Run("SwaggerPreviewShow", "open http://localhost/swagger")
end

return {
    Preview = Preview,
    Stop = StopPreview,
    Show = Show
}
