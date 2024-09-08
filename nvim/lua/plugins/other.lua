return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = function(_, opts)
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"petertriho/cmp-git",

			"L3MON4D3/LuaSnip",
			"VonHeikemen/lsp-zero.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			local expand_mappings = function(mappings, modes)
				local new_mappings = {}
				for key, map_func in pairs(mappings) do
					new_mappings[key] = cmp.mapping(map_func, modes)
				end
				return new_mappings
			end
			local mappings = {
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<Up>"] = cmp.mapping.select_prev_item(cmp_select),
				["<Down>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-Space>"] = cmp.mapping.complete(),
				["<Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					else
						fallback()
					end
				end,
				["<CR>"] = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end,
			}

			cmp.setup({
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip", keyword_length = 2 },
					{ name = "buffer", keyword_length = 3 },
				},
				formatting = require("lsp-zero").cmp_format(),
				mapping = expand_mappings(mappings, { "i", "s" }),
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				sources = {
					{ name = "buffer" },
				},
				mapping = expand_mappings(mappings, { "c" }),
			})

			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				mapping = expand_mappings(mappings, { "c" }),
			})
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
