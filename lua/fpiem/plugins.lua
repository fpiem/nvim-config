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

  -- Treesitter (semantic highlighting)
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		-- run = ':TSUpdate',
    commit = "fd4525fd9e61950520cea4737abc1800ad4aabb"
	},
	-- {
 --    'nvim-treesitter/playground',
 --    dependencies = { "nvim-treesitter/nvim-treesitter" }
 --  },

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

	{"nvim-tree/nvim-tree.lua", dependencies={"nvim-tree/nvim-web-devicons"}},

	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},

  -- Movement
  { "ggandor/leap.nvim" },
  {
    "ggandor/flit.nvim", dependencies = { { "ggandor/leap.nvim" } }
  },
  {"ggandor/leap-spooky.nvim", 
  dependencies = { { "ggandor/leap.nvim" } } ,
  config = function ()
    require('leap-spooky').setup {}
  end

},

	-- LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			-- Snippet Collection (Optional)
			{'rafamadriz/friendly-snippets'},
		}
	},

	{ "romainl/vim-cool" },  -- disable search highlights after moving the cursor

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- Fancy UI overrides
	{
		"folke/noice.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" }
		}
	},
  { "stevearc/dressing.nvim" },


	-- Themes
	{ "Mofiqul/dracula.nvim" },
	{"Mofiqul/vscode.nvim"},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({})
		end
	},
  {'folke/tokyonight.nvim'}
})
