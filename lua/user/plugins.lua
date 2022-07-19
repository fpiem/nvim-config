local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Package manager
	use({ "wbthomason/packer.nvim" })

	-- Common dependencies
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by several plugins
	use({ "kyazdani42/nvim-web-devicons" })

	-- Movement & text objects
	use({ "ggandor/leap.nvim" })
	use({ "jinh0/eyeliner.nvim" }) -- Lua port of quickscope.vim
	use({ "wellle/targets.vim" })
	use({ "kylechui/nvim-surround" })

	-- UI
	use({ "akinsho/bufferline.nvim" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Indentation guides
	use({ "nvim-lualine/lualine.nvim" })
	use({ "moll/vim-bbye" })
	use({ "folke/which-key.nvim" }) -- Group and visualize keybindings
	use({ "folke/trouble.nvim" }) -- VSCode-like problems pane

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Startup
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "goolord/alpha-nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "EdenEast/nightfox.nvim" })

	-- LSP
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer

	-- Completion
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) -- snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- Search
	use({ "nvim-telescope/telescope.nvim" })

	-- Terminal integration
	use({ "akinsho/toggleterm.nvim" })

	-- Comments
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- Misc
	-- Automatically save upon leaving insert mode
	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			require("autosave").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
