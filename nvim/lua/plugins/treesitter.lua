local filetypes = {
  'elixir', 'heex', 'eex',
  'javascript', 'typescript', 'tsx',
  'python',
}

require('nvim-treesitter').setup {
  ensure_installed = filetypes,
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function() vim.treesitter.start() end,
})
