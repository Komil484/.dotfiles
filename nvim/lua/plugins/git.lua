return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			current_line_blame = true,
            on_attach = function(bufnr) 
                local gitsigns = require("gitsigns")
                vim.keymap.set({ "n", "x", "o" }, "]h", gitsigns.next_hunk)
                vim.keymap.set({ "n", "x", "o" }, "[h", gitsigns.prev_hunk)
            end
		},
		init = function()
			vim.keymap.set("n", "<leader>gh", function()
				vim.cmd.Gitsigns("preview_hunk")
			end)
		end,
	},

	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		init = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit, { desc = "Open Neogit" })
		end,
		opts = {
			disable_hint = true,
			graph_style = "unicode",
			mappings = {
				status = {
					["<c-t>"] = false,
					["<c-s>"] = false,
					["<c-a>"] = "StageAll",
					["<c-d>"] = "TabOpen",
				},
			},
		},
	},
}
