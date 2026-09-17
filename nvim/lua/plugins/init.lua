vim.pack.add({
  'https://github.com/catppuccin/nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-treesitter/nvim-treesitter'
})

require("plugins.catppuccin")
require("plugins.fzf-lua")
require("plugins.treesitter")
require("plugins.lsp")
