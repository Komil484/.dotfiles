local set_lsp_maps = function(opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>vks", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>ve", vim.diagnostic.open_float, opts)
end

local setup_lspconfigs = function()
	local lsps = {
        "clangd",
		"csharp_ls",
        "cssls",
		"gdscript",
        "gopls",
        "html",
        "jdtls",
        "jsonls",
        "lua_ls",
        "metals",
        "nushell",
		"nil_ls",
		"nixd",
		"pylsp",
		"ruff",
		"zls",
	}

	for _, lsp in ipairs(lsps) do
		vim.lsp.enable(lsp)
	end

	vim.lsp.config("gopls", {
		settings = {
			gopls = {
				usePlaceholders = true,
			},
		},
	})

	vim.lsp.config("jdtls", {
		settings = {
			java = {
				import = {
					gradle = {
						enabled = true,
					},
				},
				configuration = {
					updateBuildConfiguration = "automatic",
				},
			},
		},
	})
end

return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"j-hui/fidget.nvim",
	},
	branch = "v3.x",
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.on_attach(function(_, bufnr)
			set_lsp_maps({ buffer = bufnr, remap = false })
		end)
		lsp_zero.extend_lspconfig()
		setup_lspconfigs()

		require("fidget").setup({
			notification = {
				window = {
					normal_hl = "Comment", -- Base highlight group in the notification window
					winblend = 0, -- Background color opacity in the notification window
					border = "none", -- Border around the notification window
					zindex = 45, -- Stacking priority of the notification window
					max_width = 0, -- Maximum width of the notification window
					max_height = 0, -- Maximum height of the notification window
					x_padding = 1, -- Padding from right edge of window boundary
					y_padding = 0, -- Padding from bottom edge of window boundary
					align = "bottom", -- How to align the notification window
					relative = "editor", -- What the notification window position is relative to
				},
			},
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
