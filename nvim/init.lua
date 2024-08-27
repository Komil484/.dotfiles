local function prequire(module_name)
	local _, ret = xpcall(function()
		return require(module_name)
	end, function(err)
		vim.notify("FAILED TO REQUIRE: " .. module_name, vim.log.levels.ERROR)
		vim.notify(err, vim.log.levels.ERROR)
	end)
	return ret
end

prequire("remap")
prequire("set")
prequire("lazy_init")
