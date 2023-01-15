local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
  return
end

lsp_zero.preset('recommended')

lsp_zero.set_preferences({
  set_lsp_keymaps = { omit = { 'K' } }  -- K is used for vertical navigation
})

lsp_zero.setup_nvim_cmp({
  sources = {
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "buffer", keyword_length = 3 },
  }
})

lsp_zero.setup()

