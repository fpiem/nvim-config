local neotest_config = function()
	require("dap-python").setup()
	local python = require("neotest-python")({
		dap = { justMyCode = false },
		runner = "pytest",
	})
	require("neotest").setup({
		adapters = {
			python,
		},
	})
	-- Press q to close the floating output window
	local group = vim.api.nvim_create_augroup("NeotestConfig", {})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "neotest-output",
		group = group,
		callback = function(opts)
			vim.keymap.set("n", "q", function()
				pcall(vim.api.nvim_win_close, 0, true)
			end, {
				buffer = opts.buf,
			})
		end,
	})
end

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",

			-- Adapters
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-vim-test",
		},
		config = neotest_config,
		keys = {
			{
				"<leader>ta",
				":lua require('neotest').run.run(vim.fn.getcwd())<CR>",
				desc = "Run tests in the current directory",
			},
			{
				"<leader>tc",
				":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
				desc = "Run tests in current file",
			},
			{ "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", desc = "Toggle test summary" },
			{ "<leader>to", ":lua require('neotest').output.open()<CR>", desc = "Open test output" },
		},
	},
	{ "vim-test/vim-test" },
}
