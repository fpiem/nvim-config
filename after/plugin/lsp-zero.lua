local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
  return
end

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-Space>"] = cmp.mapping.complete()
})

lsp_zero.preset('recommended')

lsp_zero.set_preferences({
  set_lsp_keymaps = { omit = { 'K' } }  -- K is used for vertical navigation
})

lsp_zero.setup_nvim_cmp({
  sources = {
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "buffer", keyword_length = 3 },
  },
  mapping = cmp_mappings
})

lsp_zero.setup()

