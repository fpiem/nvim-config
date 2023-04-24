require("fpiem.options")
require("fpiem.mappings")
require("fpiem.plugins")
require("fpiem.colorscheme")
if vim.g.vscode ~= nil then
	vim.cmd("source /home/francesco/.config/nvim/lua/fpiem/vscode.vim")
	vim.cmd("TSDisable highlight")
end
