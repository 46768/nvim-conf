return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {"lua", "c", "python"},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
