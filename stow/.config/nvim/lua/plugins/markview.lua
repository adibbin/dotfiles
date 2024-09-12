return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	config = function()
		local markview = require "markview"
		markview.setup({
			modes = { "n", "no", "c" },
			hybrid_modes = { "n" },
			callbacks = {
				on_enable = function(_, win)
					vim.wo[win].conceallevel = 2;
					vim.wo[win].concealcursor = "c";
				end
			}
		})
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	}
}
