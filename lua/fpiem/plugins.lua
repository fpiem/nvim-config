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
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        config = function ()
          require("window-picker").setup({})
        end
      },
    }
  },

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

  -- Clipboard management
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
      {'kkharji/sqlite.lua', module = 'sqlite'},
    }
  },

  -- Terminal
  { "akinsho/toggleterm.nvim" },

  -- Movement
  { "ggandor/leap.nvim" },
  { "ggandor/flit.nvim", dependencies = { { "ggandor/leap.nvim" } } },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  -- TODO: choose one between these
  { "tpope/vim-fugitive" },
  {
    "TimUntersberger/neogit",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "sindrets/diffview.nvim" } }
  },

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

  -- Text objects
  { "tpope/vim-surround" },
  { "wellle/targets.vim" },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = { { "ggandor/leap.nvim" } },
    config = function()
      require('leap-spooky').setup {}
    end
  },

  -- Folds
  {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},  -- Use TS or LSP as folds providers
  { 'anuvyklack/pretty-fold.nvim' },  -- Make folds look better
  {  -- Preview folds without opening them
    'anuvyklack/fold-preview.nvim',
    dependencies = 'anuvyklack/keymap-amend.nvim',
    config = function()
      require('fold-preview').setup({})
    end
  },

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

  -- Misc
  { "famiu/bufdelete.nvim" },  -- close buffers without messing up the window layout
  {  -- completion for neovim specific functions
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({})
    end
  },
  { "romainl/vim-cool" }, -- disable search highlights after moving the cursor
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  { "tpope/vim-repeat" },
})

