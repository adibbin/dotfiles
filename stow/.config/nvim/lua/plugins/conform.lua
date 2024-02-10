return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	event = {
		"BufWritePre",
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylelua" },
			typescript = { { "prettierd", "prettier" } },
		},
	}
}
