return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v4.x',
	dependencies = {
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		local lspZero = require("lsp-zero")
		local cmp = require("cmp")
		local lspAttach = function(client, bufnr)
			local opts = { buffer = bufnr }

			vim.keymap.set("n", "ce", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		end

		lspZero.extend_lspconfig({
			sign_text = true,
			lsp_attach = lspAttach,
			--capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {'lua_ls', 'clangd', 'ts_ls', 'pylsp',},
			handlers = {
				function(serverName)
					require("lspconfig")[serverName].setup({})
				end
			}
		})

		cmp.setup({
			sources = {
				{name = 'nvim_lsp'},
				{name = 'buffer'},
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
