local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
	return
end


vim.keymap.set("n", "<leader>ff", "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>" , { desc = "Search f-recent files" })
vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Search all files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search Git files" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Search recent files" })
vim.keymap.set("n", "<leader>F", builtin.live_grep, { desc = "Live grep" } )

