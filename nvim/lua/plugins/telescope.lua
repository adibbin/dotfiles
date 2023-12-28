return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	cmd = 'Telescope',
	keys = {
		{ '<leader>/',
			function()
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end,
			{ desc = '[/] Fuzzily search in current buffer' }
		},
		{ '<leader>?',       '<cmd>Telescope oldfiles<cr>',    desc = '[?] Find recently opened files' },
		{ '<leader><space>', '<cmd>Telescope buffers<cr>',     desc = '[ ] Find existing buffers' },
		{ '<leader>sf',      '<cmd>Telescope find_files<cr>',  desc = '[S]earch [F]iles' },
		{ '<leader>sh',      '<cmd>Telescope help_tags<cr>',   desc = '[S]earch [H]elp' },
		{ '<leader>sw',      '<cmd>Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
		{ '<leader>sg',      '<cmd>Telescope live_grep<cr>',   desc = '[S]earch by [G]rep' },
		{ '<leader>sr',      '<cmd>Telescope resume<cr>',      desc = '[S]earch [R]esume' },
		-- git
		{ '<leader>gc',      '<cmd>Telescope git_commits<cr>', desc = '[G]it [C]ommits' },
		{ '<leader>gf',      '<cmd>Telescope git_files<cr>',   desc = '[G]it [F]iles' },
		{ '<leader>gst',     '<cmd>Telescope git_status<cr>',  desc = '[G]it [St]atus' },

	},
	opts = {
		defaults = {
			file_ignore_ratterns = { 'node_modules' },
		}
	}
}
