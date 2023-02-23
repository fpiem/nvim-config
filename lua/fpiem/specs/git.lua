-- Git
return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	-- TODO: choose one between these
	{ "tpope/vim-fugitive" },
	{ "rbong/vim-flog", dependencies = "tpope/vim-fugitive" },
	{
		"TimUntersberger/neogit",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "sindrets/diffview.nvim" } },
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
		end,
	},
}
