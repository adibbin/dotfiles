vim.g.mapleader = " "

vim.pack.add({
  'https://github.com/catppuccin/nvim',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-treesitter/nvim-treesitter'
})

require("config.options")

require("config.keymaps")

require("config.lsp")
require("config.treesitter")
require("config.catppuccin")
