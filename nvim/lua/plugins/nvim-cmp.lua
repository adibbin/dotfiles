return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
					elseif require("copilot.suggestion").is_visible() then
						require("copilot.suggestion").accept()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's' }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}, {
				{ name = 'buffer' },
			})
		})
	end
}
