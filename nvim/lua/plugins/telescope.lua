return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	cmd = "Telescope",
	opts = {
		defaults = {
			file_ignore_patterns = { "node_modules" },
		}
	}
}
