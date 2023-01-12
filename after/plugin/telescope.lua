local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
	return
end


vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search Git files" })
vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "Search recent files" })
vim.keymap.set("n", "<leader>F", builtin.live_grep, { desc = "Live grep" } )
