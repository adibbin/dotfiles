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

-- fzf-lua
local fzf = require('fzf-lua')
map('n', '<leader><space>', fzf.files, 'Find Files')
map('n', '<leader>/', fzf.live_grep, 'Grep')
map('n', '<leader>gg', fzf.git_status, 'Git Status')
map('n', 'gA', fzf.lsp_references, 'All references')
map('n', 'gI', fzf.lsp_implementations, 'Go to Implementation')
map('n', 'gs', fzf.lsp_document_symbols, 'Symbols in File')
map('n', 'gS', fzf.lsp_workspace_symbols, 'Symbols in Project')


-- LSP
map('n', 'g.', vim.lsp.buf.code_action, 'Code Action')
map('n', 'gd', vim.lsp.buf.definition, 'Go to Definition')
map('n', 'gD', vim.lsp.buf.declaration, 'Go to Declaration')
map('n', 'gy', vim.lsp.buf.type_definition, 'Go to Type Definition')
map('n', 'g[', vim.diagnostic.goto_prev, 'Prev Diagnostic')
map('n', 'g]', vim.diagnostic.goto_next, 'Next Diagnostic')
