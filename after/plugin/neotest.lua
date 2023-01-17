local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

local python = require("neotest-python")({
  dap = { justMyCode = false },
  runner = "pytest",
})

-- Covers any filetype not covered by neotest => should ignore any filetype that neotest can handle

neotest.setup({
  adapters = {
    python
  }
})
