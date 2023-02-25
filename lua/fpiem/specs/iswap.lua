return {
  {
    "mizlan/iswap.nvim",
    config = function()
      require("iswap").setup({
        grey = "disable",
        flash_style = false,
      })
    end,
    keys = {
      { "gs", ":ISwap<CR>", desc = "Swap arguments" },
      { "gn", ":ISwapNode<CR>", desc = "Swap node positions" },
      { "gw", ":ISwapWith<CR>", desc = "Swap position of argument under the cursor" },
      { "g<", ":ISwapWithLeft<CR>", desc = "Swap with left node" },
      { "g>", ":ISwapWithRight<CR>", desc = "Swap with right node" },
    }
  },
}
