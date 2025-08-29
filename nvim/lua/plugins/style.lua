return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			on_colors = function(c)
				-- Because lualine broke stuff with the latest commit
				c.bg_statusline = c.none
			end,
			on_highlights = function(hl, c)
				-- TabLineFill is currently set to black
				hl.TabLineFill = {
					bg = c.none,
				}
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto", -- vim.g.colors_name,
				refresh = {
					statusline = 1000,
				},
			},
		},
		lazy = false,
		config = true,
	},
}
