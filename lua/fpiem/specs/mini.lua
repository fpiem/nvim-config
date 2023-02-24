return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.move").setup()
      require("mini.comment").setup()
      require("mini.bufremove").setup()
      require("mini.bracketed").setup()
      vim.keymap.set("n", "<leader>bd", ":lua require('mini.bufremove').delete()<CR>", { desc = "Delete buffer" })
    end,
    lazy = false,
  },
}
