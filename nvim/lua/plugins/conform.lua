require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = true, desc = "Format buffer" })
