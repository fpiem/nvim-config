local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.autoflake,
    formatting.isort.with({ extra_args = { "--profile", "black", "--line-length", "120" } }),
    formatting.black.with({ extra_args = { "--fast", "--line-length", "120" } }),
    diagnostics.flake8.with({ extra_args = { "--max-line-length", "120" } }),
    diagnostics.mypy,

    -- Lua
    formatting.stylua,

    -- JS
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
  },
})
