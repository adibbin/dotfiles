vim.g.mapleader = " "

vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-tree/nvim-web-devicons'
})

require("options")

require("keymaps")
require("lsp")
