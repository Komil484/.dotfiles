return {
	"echasnovski/mini.snippets",
	version = false,
	event = "InsertEnter",
	dependencies = "rafamadriz/friendly-snippets",

	opts = function()
		local gen_loader = require("mini.snippets").gen_loader
		return {
			snippets = {
				gen_loader.from_file(vim.fn.stdpath("config") .. "/snippets/global.json"),
				gen_loader.from_lang(),

				-- gen_loader.from_file(".vscode/project.code-snippets"),
			},
		}
	end,

	config = function(_, opts)
		local snippets = require("mini.snippets")
		snippets.setup(opts)
	end,
}
