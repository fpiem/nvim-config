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
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    run = ':TSUpdate',
  },
  {
    'nvim-treesitter/playground',
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {}
    end
  },

  { "RRethy/vim-illuminate" },

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  -- Movement
  { "ggandor/leap.nvim" },
  { "ggandor/flit.nvim", dependencies = { { "ggandor/leap.nvim" } } },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = { { "ggandor/leap.nvim" } },
    config = function()
      require('leap-spooky').setup {}
    end
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    }
  },

  { "romainl/vim-cool" }, -- disable search highlights after moving the cursor

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },

  -- Fancy UI overrides
  {
    "folke/noice.nvim",
    dependencies = { { "MunifTanjim/nui.nvim" } }
  },
  { "stevearc/dressing.nvim" },

  -- Themes
  { "Mofiqul/dracula.nvim" },
  { "Mofiqul/vscode.nvim" },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({})
    end
  },
  { 'folke/tokyonight.nvim' },
  {'nyoom-engineering/oxocarbon.nvim'},
  { "sainnhe/sonokai" },

  -- Completion for neovim specific functions
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
    end
  },

  -- Terminal
  { "akinsho/toggleterm.nvim" }



})
