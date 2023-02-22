local leap_all_windows = function()
	local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
		return vim.api.nvim_win_get_config(win).focusable
	end, vim.api.nvim_tabpage_list_wins(0))
	require("leap").leap({ target_windows = focusable_windows_on_tabpage })
end

return {
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", leap_all_windows, desc = "Leap all windows" },
		},
	},
	{ "ggandor/flit.nvim", dependencies = { { "ggandor/leap.nvim" } } },
	{
		"ggandor/leap-spooky.nvim",
		dependencies = { { "ggandor/leap.nvim" } },
		config = function()
			require("leap-spooky").setup({})
		end,
	},
}
