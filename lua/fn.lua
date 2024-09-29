local module = {
	feedKeyN = function (keybind)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keybind, true, false, true), 'n', true)
	end,
	OS = vim.loop.os_uname().sysname,
}

return module
