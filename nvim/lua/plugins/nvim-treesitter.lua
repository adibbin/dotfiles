return {
	"nvim-treesitter/nvim-treesitter",
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		ensure_installed = {
			'elixir',
			'go',
			'heex',
			'javascript',
			'lua',
			'python',
			'tsx',
			'typescript',
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = {
			enable = true
		},
	}
}
