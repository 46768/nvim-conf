local lsConfig = require("lsConfig.config")

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		vim.opt.signcolumn = 'yes'

		local lspconfigDefaults = require('lspconfig').util.default_config
		lspconfigDefaults.capabilities = vim.tbl_deep_extend(
		'force',
		lspconfigDefaults.capabilities,
		require('cmp_nvim_lsp').default_capabilities()
		)

		vim.api.nvim_create_autocmd('LspAttach', {
			desc = 'LSP Actions',
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set('n', 'ec', vim.diagnostic.open_float, opts)
			end,
		})

		-- Setup mason
		local mason = require('mason')
		mason.setup({
			path = "append"
		})

		-- Setup mason lsp configurator
		local masonLsp = require('mason-lspconfig')
		masonLsp.setup({
			ensure_installed = lsConfig["ensureInstalled"],
			handlers = {
				function(serverName)
					if lsConfig[serverName] ~= nil then
						require('lspconfig')[serverName].setup(lsConfig[serverName])
					else
						require('lspconfig')[serverName].setup({})
					end
				end
			}
		})

		-- Setup autocompletion
		local cmp = require('cmp')
		cmp.setup({
			sources = {
				{name = 'nvim_lsp'},
				{name = 'buffer'},
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-c>'] = cmp.mapping.confirm({select = true}),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-j>'] = cmp.mapping.select_next_item(),
				['<C-k>'] = cmp.mapping.select_prev_item(),
			})
		})
	end,
}
