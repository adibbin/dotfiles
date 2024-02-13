return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	event = {
		"BufWritePre",
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylelua" },
			python = { "ruff_format" },
			typescript = { { "prettierd", "prettier" } },
		},
	}
}
