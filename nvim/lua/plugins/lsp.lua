vim.lsp.enable('expert')
vim.lsp.enable('ts_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true})
    end
  end,
})

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
