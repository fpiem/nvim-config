local dap = require("dap")
local dapui = require("dapui").setup()

require('telescope').load_extension('dap')
require('dap-python').setup()

vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "Debug start/continue" })
vim.keymap.set("n", "<F5>", ":lua require('dap').continue()<CR>", { desc = "Debug start/continue" })
vim.keymap.set("n", "<leader>do", ":lua require('dap').step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<F10>", ":lua require('dap').step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<F11>", ":lua require('dap').step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>dj", ":lua require('dap').step_out()<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })

vim.keymap.set("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })

