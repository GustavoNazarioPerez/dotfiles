return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({ -- your configuration comes here
			style = "storm",
			light_style = "day",
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
			sidebars = { "qf", "help" },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false,
		})

		vim.o.background = "dark" -- "light" for light mode
		vim.cmd([[colorscheme tokyonight]])
		vim.cmd('highlight LineNr guifg=#a9a9a9')
	end
}
