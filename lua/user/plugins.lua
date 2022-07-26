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

	-- Movement
	use({ "ggandor/leap.nvim" })
	use({ "jinh0/eyeliner.nvim" }) -- Lua port of quickscope.vim
	use({ "chentoast/marks.nvim", config = require("marks").setup() })

	-- Text objects
	use({ "wellle/targets.vim" })
	use({ "kylechui/nvim-surround" })
	use({ "andymass/vim-matchup" }) -- Improve the % operator
	use({ "kana/vim-textobj-line", requires = "kana/vim-textobj-user" })

	-- UI
	use({ "akinsho/bufferline.nvim" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Indentation guides
	use({ "nvim-lualine/lualine.nvim" })
	use({ "moll/vim-bbye" })
	use({ "folke/which-key.nvim" }) -- Group and visualize keybindings
	use({ "folke/trouble.nvim" }) -- VSCode-like problems pane
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }) -- Better folding
	use({ "RRethy/vim-illuminate" }) -- Highlight variable under cursor
	use({
		"filipdutescu/renamer.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require("renamer").setup(),
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "f-person/git-blame.nvim" })
	use({
		"TimUntersberger/neogit",
		requires = "nvim-lua/plenary.nvim",
		config = require("neogit").setup(),
	})

	-- Startup
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "goolord/alpha-nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "navarasu/onedark.nvim" })

	-- LSP
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer

	-- CMP
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Debug
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "theHamsta/nvim-dap-virtual-text", requires = { "mfussenegger/nvim-dap" } })
	use({ "mfussenegger/nvim-dap-python" }) -- requires debugpy to be installed in the venv

	-- Refactoring
	-- TODO: look into this
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = require("refactoring").setup(),
	})

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
	use({ "Pocco81/AutoSave.nvim" }) -- Automatically save upon leaving insert mode
	use({ "echasnovski/mini.nvim" }) -- A collection of multiple useful modules

	-- Copilot
	use({ "github/copilot.vim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
