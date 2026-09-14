vim.g.mapleader = " "

vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-treesitter/nvim-treesitter'
})

require("options")

require("keymaps")
require("lsp")
require("treesitter")
