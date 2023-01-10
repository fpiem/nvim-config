local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
	"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		run = ':TSUpdate'
	},

	{ 'nvim-treesitter/playground' },

	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons'
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},

	{
		"folke/noice.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" }
		}
	},
	{"nvim-tree/nvim-tree.lua", dependencies={"nvim-tree/nvim-web-devicons"}},

	-- Themes
	{ "Mofiqul/dracula.nvim" },
	{"Mofiqul/vscode.nvim"},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({})
		end
	},
})
