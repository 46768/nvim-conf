local OSName = vim.loop.os_uname().sysname

local module = {
	OS = OSName,
	DATA = vim.fn.stdpath('data'),

	normalizePath = function(path)
		path = path:gsub("\\", "/")
		return path
	end,
	fixMasonBin = function(path)
		if OSName == "Windows_NT" then
			path = path .. ".cmd"
		end
		return path
	end,
}

return module
