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
			lsp_fallback = true,
			timeout_ms = 500,
		},
		formatters_by_ft = {
			javascript = { prettier },
			json = { prettier },
			lua = { "stylelua" },
			markdown = { prettier, "injected" },
			python = { "ruff_format" },
			sh = { "shfmt" },
			typescript = { prettier },
		},
	}
}
