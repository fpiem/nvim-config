local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

neoclip.setup({
  enable_persistent_history = true
})

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

vim.keymap.set("n", "<leader>b", ":lua require('telescope').extensions.neoclip.default()<CR>", { desc = "Search yanks" })
