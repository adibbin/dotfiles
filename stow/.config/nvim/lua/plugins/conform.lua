return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	event = {
		"BufWritePre",
	},
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylelua" },
			python = { "ruff_format" },
			sh = { "shfmt" },
			typescript = { { "prettierd", "prettier" } },
		},
	}
}
