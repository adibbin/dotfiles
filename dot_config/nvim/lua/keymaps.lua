local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Quickfix
map('n', ']q', '<cmd>cnext<CR>', 'Next quickfix item')
map('n', '[q', '<cmd>cprev<CR>', 'Prev quickfix item')

-- Window navigation
map('n', '<C-h>', '<C-w><C-h>', 'Focus left window')
map('n', '<C-l>', '<C-w><C-l>', 'Focus right window')
map('n', '<C-j>', '<C-w><C-j>', 'Focus lower window')
map('n', '<C-k>', '<C-w><C-k>', 'Focus upper window')
