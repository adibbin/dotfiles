require("snacks").setup({
  gitbrowse = { enabled = true },
})

vim.keymap.set('n', '<leader>go', function()
  require("snacks").gitbrowse()
end, { desc = 'Open Line in Browser' })
