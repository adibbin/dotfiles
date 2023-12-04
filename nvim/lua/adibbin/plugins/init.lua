local plugins = {
	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = function()
			return require "adibbin.plugins.configs.catppuccin"
		end,
		config = function()
			require("catppuccin").setup(opts)
			vim.cmd([[colorscheme catppuccin]])
		end
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	},

	-- Hardtime
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	},

	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
		opts = function()
			return require "adibbin.plugins.configs.lualine"
		end,
		config = function(_, opts)
			require('lualine').setup(opts)
		end
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		config = true,
		dependencies = {
			-- LSP Support
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",

			-- Autocompletion
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',

			-- Snippets
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},

	-- NvimTree
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		cmd = {
			'NvimTreeToggle',
			'NvimTreeFocus'
		},
		opts = function()
			return require('adibbin.plugins.configs.nvimtree')
		end,
		config = function(_, opts)
			require('nvim-tree').setup(opts)
		end
	},

	-- NvimTreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = function()
			return require "adibbin.plugins.configs.treesitter"
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end
	},


	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = "Telescope",
		opts = function()
			return require "adibbin.plugins.configs.telescope"
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
		end
	}
}

require("lazy").setup(plugins)
