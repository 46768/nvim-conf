require("startup.terminal")
require("startup.windows")

local lineTotal = vim.o.lines-2
local mainLines = math.floor(0.7*lineTotal)
local termLines = lineTotal - mainLines

vim.cmd.NvimTreeFocus()

vim.api.nvim_set_current_win(1001)
vim.cmd.resize(mainLines)
