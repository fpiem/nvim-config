local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
  return
end

require('dap-python').setup()

local python = require("neotest-python")({
  dap = { justMyCode = false },
  runner = "pytest",
})

neotest.setup({
  adapters = {
    python
  }
})

vim.keymap.set("n", "<leader>ta", ":lua require('neotest').run.run(vim.fn.getcwd())<CR>",
  { desc = "Run tests in the current directory" })
vim.keymap.set("n", "<leader>tc", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { desc = "Run tests in current file" })
vim.keymap.set("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", { desc = "Toggle test summary" })
vim.keymap.set("n", "<leader>to", ":lua require('neotest').output.open()<CR>", { desc = "Open test output" })

-- Press q to close the floating output window
local group = vim.api.nvim_create_augroup("NeotestConfig", {})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neotest-output",
  group = group,
  callback = function(opts)
    vim.keymap.set("n", "q", function()
      pcall(vim.api.nvim_win_close, 0, true)
    end, {
      buffer = opts.buf,
    })
  end,
})

