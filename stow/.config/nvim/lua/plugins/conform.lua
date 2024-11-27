return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		formatters_by_ft = {
			javascript = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			lua = { "stylelua" },
			markdown = { "prettierd", "prettier", "injected" },
			python = { "ruff_format" },
			sh = { "shfmt" },
			typescript = { "prettierd", "prettier" },
		},
	},
	keys = {
		{
			'<leader>f',
			function()
				require('conform').format { async = true, lsp_fallback = true }
			end,
			desc = '[F]ormat buffer',
		},
	},
}
