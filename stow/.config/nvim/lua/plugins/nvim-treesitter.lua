return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	opts = {
		ensure_installed = {
			'bash',
			'c',
			'elixir',
			'go',
			'heex',
			'javascript',
			'lua',
			'markdown',
			'markdown_inline',
			'python',
			'query',
			'tsx',
			'typescript',
			'vim',
			'vimdoc',
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
