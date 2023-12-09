return
{
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	cmd = {
		'NvimTreeToggle',
		'NvimTreeFocus'
	},
	opts = {
		update_focused_file = {
			enable = true,
			update_root = false,
			ignore_list = {},
		},

	}
}

