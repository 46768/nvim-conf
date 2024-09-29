local fn = require("fn")

vim.cmd.terminal()
vim.cmd.edit "term://powershell"
fn.feedKeyN('<C-w>l')
fn.feedKeyN('<C-w>j')
vim.cmd.resize "-10"

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
