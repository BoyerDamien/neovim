return {
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.yaml"] = "*swagger.yaml",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose.yaml",
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci.yaml",
				["https://json.schemastore.org/golangci-lint.json"] = "*golangci.yaml",
			},
			validate = true,
			completion = true,
			hover = true,
			format = {
				enable = true,
			},
		},
	},
}
