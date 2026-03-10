return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"lewis6991/gitsigns.nvim",
	},
	build = function()
		vim.cmd("TSUpdate")
	end,
	opts = {
		auto_install = true,
		ensure_installed = { "lua" },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				-- keymaps = {
				-- 	["af"] = "@function.outer",
				-- 	["if"] = "@function.inner",
				-- 	["ac"] = "@class.outer",
				-- 	["ic"] = "@class.inner",
				-- 	["as"] = "@scope.outer",
				-- 	["ar"] = "@parameter.outer",
				-- 	["ir"] = "@parameter.inner",
				-- },
				-- selection_modes = {
				-- 	["@function.outer"] = "V",
				-- 	["@class.outer"] = "V",
				-- },
				include_surrounding_whitespace = true,
			},
			move = {
				enable = true,
				set_jumps = true,
				-- goto_next_start = {
				-- 	["]f"] = "@function.outer",
				-- 	["]]"] = "@class.outer",
				-- },
				-- goto_next_end = {
				-- 	["]F"] = "@function.outer",
				-- 	["]["] = "@class.outer",
				-- },
				-- goto_previous_start = {
				-- 	["[f"] = "@function.outer",
				-- 	["[["] = "@class.outer",
				-- },
				-- goto_previous_end = {
				-- 	["[F"] = "@function.outer",
				-- 	["[]"] = "@class.outer",
				-- },
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.config").setup(opts)
		require("treesitter-context").setup({ separator = "─", max_lines = 5 })
	end,
}
