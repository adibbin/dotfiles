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
				map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
				map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

				-- Hover
				map('K', vim.lsp.buf.hover, 'Hover')
			end
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local servers = {
			bashls = {},
			elixirls = {},
			lua_ls = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			ruff_lsp = {},
			tsserver = {},
		}

		require('mason').setup()
		require('mason-tool-installer').setup { ensure_installed = servers }
		require('mason-lspconfig').setup {
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end,
			},
		}
	end,
}
