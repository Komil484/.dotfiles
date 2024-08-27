return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "(cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release) -and (cmake --build build --config Release) -and (cmake --install build --prefix build)",
		},
	},
	config = function()
		local add_hidden_flags = function(command)
			table.insert(command, "--hidden")
			table.insert(command, "--glob")
			table.insert(command, "!**/.git/*")
			return command
		end
		local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

		require("telescope").setup({
			defaults = {
				vimgrep_arguments = add_hidden_flags(vimgrep_arguments),
			},
			pickers = {
				find_files = {
					find_command = add_hidden_flags({ "rg", "--files" }),
				},
			},
		})
		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>kf", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "Telescope files" })
		vim.keymap.set("n", "<leader>ko", builtin.oldfiles, { desc = "Telescope recent files" })
		vim.keymap.set("n", "<leader>kw", builtin.live_grep, { desc = "Telescope grep" })
		vim.keymap.set("n", "<leader>kh", builtin.help_tags, { desc = "Telescope help" })
		vim.keymap.set("n", "<leader>kb", builtin.git_branches, { desc = "Telescope git branches" })
		vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Telescope keymaps" })
	end,
}
