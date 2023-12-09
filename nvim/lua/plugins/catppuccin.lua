return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "frappe",
	},
	config = function()
		require("catppuccin").setup(opts)
		vim.cmd([[colorscheme catppuccin]])
	end
}
