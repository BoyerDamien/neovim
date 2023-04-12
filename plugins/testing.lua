local m = {}

function m.setup()
	-- get neotest namespace (api call creates or returns namespace)
	local neotest_ns = vim.api.nvim_create_namespace("neotest")
	vim.diagnostic.config({
		virtual_text = {
			format = function(diagnostic)
				local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
				return message
			end,
		},
	}, neotest_ns)

	require("neotest").setup({
		adapters = {

			-- Neo test go
			require("neotest-go")({
				experimental = {
					test_table = true,
				},
				args = { "-count=1", "-timeout=60s" },
			}),
		},
	})
end

return m
