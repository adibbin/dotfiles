require('nvim-treesitter').setup {}

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'elixir',
    'eelixir',
    'heex',
    'eex',
    'javascript',
    'typescript',
    'tsx' },
  callback = function() vim.treesitter.start() end,
})
