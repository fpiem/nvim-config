local status_ok, mini = pcall(require, "mini.move")
if not status_ok then
	return
end

require('mini.move').setup()
require('mini.comment').setup()
require('mini.bufremove').setup()

vim.keymap.set("n", "<leader>bd", ":lua require('mini.bufremove').delete()<CR>", { desc = "Delete buffer" })

