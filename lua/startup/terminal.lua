local fn = require("fn")

vim.cmd.terminal()
if (fn.OS == "Windows_NT") then
	vim.cmd.edit "term://powershell"
elseif (fn.OS == "Linux") then
	vim.cmd.edit "term://bash"
end
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
