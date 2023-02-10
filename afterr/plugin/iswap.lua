local status_ok, iswap = pcall(require, "iswap")
if not status_ok then
  return
end

iswap.setup({
  grey = "disable",
  flash_style = false
})

vim.keymap.set("n", "gs", ":ISwap<CR>", { desc = "Swap arguments" })
vim.keymap.set("n", "gn", ":ISwapNode<CR>", { desc = "Swap node positions" })
vim.keymap.set("n", "gw", ":ISwapWith<CR>", { desc = "Swap position of argument under the cursor" })
vim.keymap.set("n", "g<", ":ISwapWithLeft<CR>", { desc = "Swap with left node" })
vim.keymap.set("n", "g>", ":ISwapWithRight<CR>", { desc = "Swap with right node" })
