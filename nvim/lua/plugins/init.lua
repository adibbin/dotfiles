vim.pack.add({
  'https://github.com/catppuccin/nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-treesitter/nvim-treesitter'
})

require("plugins.catppuccin")
require("plugins.fzf-lua")
require("plugins.gitsigns")
require("plugins.lsp")
require("plugins.treesitter")
