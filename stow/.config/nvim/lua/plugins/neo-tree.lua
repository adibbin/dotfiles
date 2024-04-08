return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	keys = {
		{ "<leader>b", "<CMD>Neotree toggle<CR>" },
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true
			}
		},
	}
}
