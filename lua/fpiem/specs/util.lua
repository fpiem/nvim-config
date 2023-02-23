return {
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "wellle/targets.vim" },

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({})
		end,
	},

	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				execution_message = {
					message = "",
				},
			})
		end,
	},

	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
	},

	-- Disable search highlights after moving the cursor
	{ "romainl/vim-cool" },

	-- Highlight the word under the cursor
	{ "RRethy/vim-illuminate" },

	{
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({})
		end,
	},

	-- Clipboard management
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			require("neoclip").setup({
				enable_persistent_history = true,
			})
			vim.keymap.set(
				"n",
				"<leader>sy",
				":lua require('telescope').extensions.neoclip.default()<CR>",
				{ desc = "Search yanks" }
			)
		end,
	},

	{ "mizlan/iswap.nvim" },
}
