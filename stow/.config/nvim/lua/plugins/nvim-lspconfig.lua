return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
				end

				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

				-- GOTO
				map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
				map('gs', require('telescope.builtin').lsp_document_symbols, '[G]oto [s]ymbols')
				map('gS', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[G]oto workspace [S]ymbols')

				-- Hover
				map('K', vim.lsp.buf.hover, 'Hover')
			end
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local lsps = {
			bashls = {},
			elixirls = {},
			eslint = {},
			lua_ls = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			marksman = {},
			ruff_lsp = {},
			vtsls = {},
		}

		local formatters = {
			'prettier',
			'prettierd',
		}

		local ensure_installed = vim.tbl_keys(lsps)
		vim.list_extend(ensure_installed, formatters)

		require('mason').setup()
		require('mason-tool-installer').setup { ensure_installed = ensure_installed }
		require('mason-lspconfig').setup {
			handlers = {
				function(server_name)
					local server = lsps[server_name] or {}
					server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end,
			},
		}
	end,
}
