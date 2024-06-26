-- Configuring All Plugins
return {
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 , opts = {} }, {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
			}
	}
}
