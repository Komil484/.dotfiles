return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		image = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = { enabled = true },
	},
	keys = {
		{
			"<leader>kf",
			function()
				Snacks.picker.smart()
			end,
			desc = "Snacks picker: Smart Find Files",
		},
		{
			"<leader>kw",
			function()
				Snacks.picker.grep()
			end,
			desc = "Snacks picker: Grep",
		},
		{
			"<leader>kn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Snacks picker: Notifications",
		},
		{
			"<leader>ke",
			function()
				Snacks.picker.explorer()
			end,
			desc = "Snacks File Explorer",
		},
		{
			"<leader>km",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Snacks picker: Keymaps",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		-- LSP
		-- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
		-- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
		-- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
		-- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
		-- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
		--
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Override print to use snacks for `:=` command
				if vim.fn.has("nvim-0.11") ~= 1 then
					vim.print = _G.dd
				end

				-- Create some toggle mappings
				-- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
			end,
		})
	end,
}
