return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup()

		local servers = {
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

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		local mason_lspconfig = require 'mason-lspconfig'
		mason_lspconfig.setup {
			ensure_installed = vim.tbl_keys(servers),
		}

		mason_lspconfig.setup_handlers {
			function(server_name)
				require('lspconfig')[server_name].setup {
					capabilities = capabilities,
					on_attach = require('config.keymap').on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				}
			end,
		}
	end,
}
