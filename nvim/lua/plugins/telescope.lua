return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	cmd = 'Telescope',
	keys = {
		{ '<leader>f',
			function()
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end,
			{ desc = '[f]uzzily search in current buffer' }
		},

		{ '<leader><space>', '<cmd>Telescope buffers<cr>',     desc = '[ ] buffers' },

		-- Search
		{ '<leader>sf',      '<cmd>Telescope find_files<cr>',  desc = '[s]earch [f]iles' },
		{ '<leader>sg',      '<cmd>Telescope live_grep<cr>',   desc = '[s]earch [a]ll' },
		{ '<leader>sh',      '<cmd>Telescope help_tags<cr>',   desc = '[s]earch [h]elp' },
		{ '<leader>so',      '<cmd>Telescope oldfiles<cr>',    desc = '[s]earch [o]ld files' },
		{ '<leader>sw',      '<cmd>Telescope grep_string<cr>', desc = '[s]earch [w]ord' },

		-- Git
		{ '<leader>gc',      '<cmd>Telescope git_commits<cr>', desc = '[g]it [c]ommits' },
		{ '<leader>gf',      '<cmd>Telescope git_files<cr>',   desc = '[g]it [f]iles' },
		{ '<leader>gs',      '<cmd>Telescope git_status<cr>',  desc = '[g]it [s]tatus' },

	},
	opts = {
		defaults = {
			file_ignore_ratterns = { 'node_modules' },
		}
	}
}
