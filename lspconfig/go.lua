return {
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
            experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				unreachable = true,
			},
			linksInHover = true,
			staticcheck = true,
			usePlaceholders = false,
			codelenses = {
				generate = true,
				gc_details = true,
				regenerate_cgo = true,
				tidy = true,
				upgrade_depdendency = true,
				vendor = true,
				test = true
			},
		},
	},
}
