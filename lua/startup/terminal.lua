local fn = require("fn")

vim.cmd.terminal()
vim.cmd.edit "term://bash"
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
