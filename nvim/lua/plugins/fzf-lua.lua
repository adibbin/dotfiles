local fzf = require('fzf-lua')

local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- fzf-lua mappings
map('n', '<leader><space>', fzf.files, 'Find Files')
map('n', '<leader>/', fzf.live_grep, 'Grep')
map('n', '<leader>gg', fzf.git_status, 'Git Status')
map('n', '<leader>gL', fzf.git_commits, 'Git Log')
map('n', 'gA', fzf.lsp_references, 'All references')
map('n', 'gI', fzf.lsp_implementations, 'Go to Implementation')
map('n', 'gs', fzf.lsp_document_symbols, 'Symbols in File')
map('n', 'gS', fzf.lsp_workspace_symbols, 'Symbols in Project')
