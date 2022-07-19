local M = {}

-- Searching in all windows (including the current one) on the tab page.
M.leap_all_windows = function()
	local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
		return vim.api.nvim_win_get_config(win).focusable
	end, vim.api.nvim_tabpage_list_wins(0))
	require("leap").leap({ target_windows = focusable_windows_on_tabpage })
end

-- Bidirectional search in the current window is just a specific case of the
-- multi-window mode.
M.leap_current_window = function()
	local current_window = vim.api.nvim_get_current_win()
	require("leap").leap({ target_windows = { current_window } })
end

vim.api.nvim_set_keymap("n", "s", ":lua require('user.leap').leap_all_windows()<CR>", { noremap = true, silent = true })

return M
