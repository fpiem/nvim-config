-- First off, activate the telescope extension
local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension('aerial')

local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

aerial.setup()

