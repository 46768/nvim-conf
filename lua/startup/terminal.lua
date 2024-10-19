local fn = require('fn')

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
-- Store the terminal buffer and window globally
local terminal_bufnr = nil
local terminal_winid = nil

-- Toggle function to show/hide the same terminal
function ToggleTerminal()
    if terminal_bufnr and vim.api.nvim_buf_is_valid(terminal_bufnr) then
        -- If the terminal window is open, close it
        if terminal_winid and vim.api.nvim_win_is_valid(terminal_winid) then
            vim.api.nvim_win_hide(terminal_winid)
            terminal_winid = nil
        else
            -- If the terminal buffer exists but is hidden, show it
            vim.cmd("split")
            terminal_winid = vim.api.nvim_get_current_win()
            vim.api.nvim_win_set_buf(terminal_winid, terminal_bufnr)
        end
    else
        -- If the terminal doesn't exist, create a new one
		if fn.OS == "windows_NT" then
			vim.cmd("split | term powershell")
		else
			vim.cmd("split | term bash")
		end
        terminal_bufnr = vim.api.nvim_get_current_buf()
        terminal_winid = vim.api.nvim_get_current_win()
    end
end

-- Keymap to toggle the terminal
vim.api.nvim_set_keymap('n', '<leader>t', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
