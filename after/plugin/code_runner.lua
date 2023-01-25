local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
  return
end

code_runner.setup({
  mode = "toggleterm"
})

vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Run current file" })
