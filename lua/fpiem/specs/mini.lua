return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.move").setup()
			require("mini.comment").setup()
			require("mini.bufremove").setup()
		end,
		keys = { "<leader>bd", ":lua require('mini.bufremove').delete()<CR>", desc = "Delete buffer" },
		lazy = false,
	},
}
