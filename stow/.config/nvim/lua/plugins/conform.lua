local prettier = { "prettierd", "prettier" }

return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			'<leader>f',
			function()
				require('conform').format { async = true, lsp_fallback = true }
			end,
			mode = '',
			desc = '[F]ormat buffer',
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			javascript = { prettier },
			lua = { "stylelua" },
			markdown = { prettier, "injected" },
			python = { "ruff_format" },
			sh = { "shfmt" },
			typescript = { prettier },
		},
	}
}
