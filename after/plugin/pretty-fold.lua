local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
  return
end

pretty_fold.setup({
  fill_char = '·',
})

vim.keymap.set("n", "m", "zc", { desc = "Close fold under cursor" })
vim.keymap.set("n", "M", "zo", { desc = "Open fold under cursor" })

