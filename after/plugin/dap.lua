local dap = require("dap")
local dapui = require("dapui")

require('telescope').load_extension('dap')
require('dap-python').setup()

vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "toggle_breakpoint" })
