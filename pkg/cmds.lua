---------------------------------------------------------------------------------
--                              Utils commands
---------------------------------------------------------------------------------
--vim.api.nvim_command("command! -nargs=* Terminal lua require('pkg/utils').Terminal(<q-args>)")

vim.api.nvim_command("command! Terminal lua require('pkg/terminal').Open('zsh')")
vim.api.nvim_command("command! LazyGit lua require('pkg/utils').LazyGit()")
vim.api.nvim_command("command! LazyDocker lua require('pkg/utils').LazyDocker()")

---------------------------------------------------------------------------------
--                              Docker commands
---------------------------------------------------------------------------------
vim.api.nvim_command("command! -nargs=1 -complete=dir DeployDockerImage lua require('pkg/ops/docker').DeployDockerImage(<f-args>)")
vim.api.nvim_command("command! -nargs=1 -complete=dir DeployAllDockerImages lua require('pkg/ops/docker').DeployAllDockerImages(<f-args>)")

---------------------------------------------------------------------------------
--                              Kubernetes commands
---------------------------------------------------------------------------------
vim.api.nvim_command("command! -nargs=* -complete=dir CreateCluster lua require('pkg/ops/kubernetes').CreateCluster(<f-args>)")
vim.api.nvim_command("command! -nargs=* -complete=dir DeployHelmChart lua require('pkg/ops/kubernetes').DeployHelmChart(<f-args>)")
vim.api.nvim_command("command! -nargs=1 -complete=dir DeployAllHelmCharts lua require('pkg/ops/kubernetes').DeployAllHelmCharts(<f-args>)")
vim.api.nvim_command("command! -nargs=1 DeleteCluster lua require('pkg/ops/kubernetes').DeleteCluster(<f-args>)")
vim.api.nvim_command("command! InpsectCluster lua require('pkg/ops/kubernetes').Inpsect()")

---------------------------------------------------------------------------------
--                              Swagger commands
---------------------------------------------------------------------------------
vim.api.nvim_command("command! SwaggerPreview lua require('pkg.Swagger').Preview(vim.api.nvim_buf_get_name(0))")
-- vim.api.nvim_command("command! -nargs=1 -complete=file SwaggerPreview lua require('pkg.Swagger').Preview(<f-args>)")
vim.api.nvim_command("command! SwaggerPreviewStop lua require('pkg.Swagger').Stop()")
vim.api.nvim_command("command! SwaggerPreviewShow lua require('pkg.Swagger').Show()")
