local status_ok, mini = pcall(require, "mini")
if not status_ok then
	return
end

require('mini.move').setup()
require('mini.comment').setup()
