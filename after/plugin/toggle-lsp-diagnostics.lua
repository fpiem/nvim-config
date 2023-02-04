local status_ok, toggle = pcall(require, "toggle_lsp_diagnostics")
if not status_ok then
  return
end

toggle.init({
  virtual_text = false,
})


vim.keymap.set("n", "<leader>ltu", "<Plug>(toggle-lsp-diag-underline)", { desc = "Toggle underline" })
vim.keymap.set("n", "<leader>lts", "<Plug>(toggle-lsp-diag-signs)", { desc = "Toggle signs" })
vim.keymap.set("n", "<leader>ltv", "<Plug>(toggle-lsp-diag-vtext)", { desc = "Toggle virtual text" })

