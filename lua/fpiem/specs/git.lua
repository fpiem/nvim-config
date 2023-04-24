local diffview_config = function()
  local actions = require("diffview.actions")
  require("diffview").setup({
    enhanced_diff_hl = true,
    keymaps = {
      disable_defaults = false,
      file_panel = {
        { "n", "<l>", actions.select_entry,       { desc = "Open the diff for the selected entry." } },
        { "n", "?",   actions.help("file_panel"), { desc = "Open the help panel" } },
      },
    },
  })
end

return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = diffview_config,
  },

  -- TODO: choose one between these
  { "tpope/vim-fugitive" },
  { "rbong/vim-flog",    dependencies = "tpope/vim-fugitive" },
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
