return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = function(_, opts)
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufReadPre",
		opts = {
			scope = { enabled = false },
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"tpope/vim-unimpaired",
		keys = { "[", "]" },
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = true,
	},

	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		opts = {
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, bufnr)
					return name == ".."
				end,
			},
			float = {
				padding = 4,
				max_width = 100,
				max_height = 80,
			},
		},
		init = function()
			vim.keymap.set("n", "-", function()
				vim.cmd.Oil("--float")
			end, { desc = "Open file explorer" })
		end,
	},

	{
		"mfussenegger/nvim-lint",
		ft = "gdscript",
		config = function()
			require("lint").linters_by_ft = {
				gdscript = { "gdlint" },
			}

			vim.api.nvim_create_augroup("__linter__", { clear = true })
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				group = "__linter__",
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"shortcuts/no-neck-pain.nvim",
		lazy = false,
		opts = {
			width = 105,
			autocmds = {
				enableOnVimEnter = true,
				skipEnteringNoNeckPainBuffer = true,
			},
		},
		init = function()
			vim.keymap.set("n", "<leader>n", vim.cmd.NoNeckPain, { desc = "Toggle side buffers" })
		end,
	},

	{
		"olimorris/persisted.nvim",
		lazy = false, -- make sure the plugin is always loaded at startup
		version = false,
		opts = {
			defaults = {
				autostart = true,
				save_dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- Directory where session files are saved
			},
			ignored_dirs = {
				{ "~", exact = true },
			},
		},
		config = function(_, opts)
			require("persisted").setup(opts)
			require("telescope").load_extension("persisted")

			vim.keymap.set("n", "<leader>ll", vim.cmd.SessionLoadLast, { desc = "Load previous session" })

			vim.keymap.set("n", "<leader>q", function()
				vim.cmd.SessionSave()
				vim.cmd.wqall()
			end, { desc = "Exit and save session" })

			vim.keymap.set("n", "<leader>Q", function()
				vim.cmd.SessionDelete()
				vim.cmd.wqall()
			end, { desc = "Exit and delete session" })

			vim.keymap.set("n", "<leader>kl", function()
				vim.cmd.Telescope("persisted")
			end, { desc = "Telescope sessions" })

			if vim.fn.argc() == 0 then
				vim.cmd.SessionLoad()
			end
		end,
	},
}
