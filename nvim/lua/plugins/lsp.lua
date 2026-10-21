vim.lsp.enable('expert')
vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')

local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

-- LSP mappings
map('n', 'cd', vim.lsp.buf.rename, 'Rename Symbol')
map('n', 'g.', vim.lsp.buf.code_action, 'Code Action')
map('n', 'gd', vim.lsp.buf.definition, 'Go to Definition')
map('n', 'gD', vim.lsp.buf.declaration, 'Go to Declaration')
map('n', 'gh', vim.lsp.buf.hover, 'Hover')
map('n', 'gy', vim.lsp.buf.type_definition, 'Go to Type Definition')
map('n', 'g[', vim.diagnostic.goto_prev, 'Prev Diagnostic')
map('n', 'g]', vim.diagnostic.goto_next, 'Next Diagnostic')
