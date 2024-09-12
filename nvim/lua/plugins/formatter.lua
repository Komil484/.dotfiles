local function get_default_config_path(config_file)
	-- Get the full path of the current Lua script
	local info = debug.getinfo(1, "S")

	-- Removes the "@" character from the path
	local script_path = info.source:sub(2)

	-- Get the directory of the script
	local format_directory = vim.fn.fnamemodify(script_path, ":h")

	return vim.fs.joinpath(format_directory, "formatter_configs", config_file)
end

local function get_command_for_config(config_file, default_command, project_command)
	if vim.fn.findfile(config_file, ".;") ~= "" then
		return project_command or { exe = default_command.exe }
	end

	vim.notify("Couldn't find format config in worktree, using default config")
	return default_command or { exe = project_command.exe }
end

return {
	"mhartington/formatter.nvim",
	cmd = "FormatWrite",
	init = function()
		vim.api.nvim_create_augroup("__formatter__", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			filetype = {
				lua = { require("formatter.filetypes.lua").stylua },
				cpp = {
					function()
						local config_file = ".clang-format"
						local exe = "clang-format"
						return get_command_for_config(config_file, {
							exe = exe,
							args = {
								"-style=file:" .. get_default_config_path(config_file),
								"-assume-filename",
								util.escape_path(util.get_current_buffer_file_name()),
							},
							stdin = true,
						}, require("formatter.filetypes.cpp").clangformat())
					end,
				},
				c = {
					function()
						local config_file = ".clang-format"
						local exe = "clang-format"
						return get_command_for_config(config_file, {
							exe = exe,
							args = {
								"-style=file:" .. get_default_config_path(config_file),
								"-assume-filename",
								util.escape_path(util.get_current_buffer_file_name()),
							},
							stdin = true,
						}, require("formatter.filetypes.c").clangformat())
					end,
				},
				rust = { require("formatter.filetypes.rust").rustfmt },
				cs = { require("formatter.filetypes.cs").csharpier },
				python = { require("formatter.filetypes.python").ruff },
				nix = { require("formatter.filetypes.nix").nixfmt },
				gdscript = {
					function()
						return { exe = "gdformat" }
					end,
				},
				scala = {
					function()
						local config_file = ".scalafmt.conf"
						return get_command_for_config(config_file, {
							exe = "scalafmt",
							args = { "--config", get_default_config_path(config_file) },
						})
					end,
				},
			},
		})
	end,
}
