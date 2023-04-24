return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{ "<leader>dc", ":lua require('dap').continue()<CR>", desc = "Debug start/continue" },
			{ "<F5>", ":lua require('dap').continue()<CR>", desc = "Debug start/continue" },
			{ "<leader>do", ":lua require('dap').step_over()<CR>", desc = "Step over" },
			{ "<F7>", ":lua require('dap').step_over()<CR>", desc = "Step over" },
			{ "<leader>di", ":lua require('dap').step_into()<CR>", desc = "Step into" },
			{ "<F9>", ":lua require('dap').step_into()<CR>", desc = "Step into" },
			{ "<leader>di", ":lua require('dap').step_into()<CR>", desc = "Step out" },
			{ "<F8>", ":lua require('dap').step_into()<CR>", desc = "Step out" },
			{ "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
		keys = {
			{ "<leader>dt", ":lua require('dapui').toggle()<CR>", desc = "Toggle DAP UI" },
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
}
