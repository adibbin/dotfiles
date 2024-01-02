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
		{ "<leader>e", "<CMD>Neotree<CR>", desc = "File explorer" },
	},
	opts = {
		filesystem = {
			follow_current_file = {
				enabled = true
			}
		},
		window = {
			width = 37,
		}
	}
}
