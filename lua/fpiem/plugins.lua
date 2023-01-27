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
  -- TODO: check out telescope extensions, some are quite cool
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
    end,
    dependencies = { "kkharji/sqlite.lua" }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
      require('telescope').load_extension('fzf')
    end
  },
  {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require 'telescope'.load_extension('project')
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { 'nvim-treesitter/playground' },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "ckolkey/ts-node-action",
    dependencies = { 'nvim-treesitter' },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {}
    end
  },

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
        config = function()
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
      { 'nvim-telescope/telescope.nvim' },
      { 'kkharji/sqlite.lua', module = 'sqlite' },
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

  -- Lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  },

  -- Dim unused variables
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
  },

  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup {}
    end
  },

  -- Debugging
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "mfussenegger/nvim-dap-python" },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  { "nvim-telescope/telescope-dap.nvim" },

  -- Testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",

      -- Adapters
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-vim-test"
    }
  },
  { "vim-test/vim-test" },

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
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }, -- Use TS or LSP as folds providers
  { 'anuvyklack/pretty-fold.nvim' }, -- Make folds look better
  { -- Preview folds without opening them
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
  { 'folke/tokyonight.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { "sainnhe/sonokai" },
  {
    'AlexvZyl/nordic.nvim',
    config = function()
      require("nordic").setup {
        telescope = {
          style = "classic"
        },
      }
    end
  },
  { "loctvl842/monokai-pro.nvim" },


  -- Misc
  { "romainl/vim-cool" }, -- disable search highlights after moving the cursor
  { "tpope/vim-repeat" },

  -- TODO: explore using this one
  { 'ThePrimeagen/harpoon', dependencies = 'nvim-lua/plenary.nvim' },

  { 'echasnovski/mini.nvim' },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },
  { "907th/vim-auto-save" },

  { "AckslD/swenv.nvim" },

  { 'mizlan/iswap.nvim' },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup {}
    end
  },


  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        execution_message = {
          message = ""
        }
      }
    end
  },

  { "stevearc/aerial.nvim" },

  { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' },

  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("spectre").setup()
    end
  },


  {
    'abecodes/tabout.nvim',
    config = function()
      require("tabout").setup{}
    end
  }
})
