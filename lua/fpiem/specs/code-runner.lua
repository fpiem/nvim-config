return {
	{
		"CRAG666/code_runner.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("code_runner").setup({
				mode = "toggleterm",
			})
		end,
		keys = {
			{ "<leader>r", ":RunCode<CR>", desc = "Run current file" },
		},
	},
}
