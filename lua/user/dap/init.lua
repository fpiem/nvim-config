-- Ensure that nvim-dap is installed
local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

-- Configure dap for python
-- TODO: set keymaps
-- vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<CR>")
-- vim.keymap.set("n", "<F1>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
-- nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
-- nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

-- TODO: auto open dap ui whenever dap runs, and close it on stop
require("user.dap.ui")
require("user.dap.virtual-text")
require("user.dap.python")

