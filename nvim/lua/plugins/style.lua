return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function(_, opts)
			-- require("tokyonight-storm").setup(opts)
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
