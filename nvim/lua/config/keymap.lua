local nmap = function(keys, func, desc)
	vim.keymap.set('n', keys, func, { desc = desc })
end

-- Quickfix
nmap(']q', '<cmd>cnext<CR>', 'Move to the next quickfix item')
nmap('[q', '<cmd>cprev<CR>', 'Move to the previous quickfix item')

-- Window navigation
nmap('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
nmap('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
nmap('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
nmap('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')
