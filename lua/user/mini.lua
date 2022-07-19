-- Using the jump module as a Lua substitute for clever-f.vim
local status_ok, jump = pcall(require, "mini.jump")
if not status_ok then
	return
end

jump.setup({
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		forward = "f",
		backward = "F",
		forward_till = "t",
		backward_till = "T",
		repeat_jump = "", -- Disabled
	},

	-- Delay values (in ms) for different functionalities. Set any of them to
	-- a very big number (like 10^7) to virtually disable.
	delay = {
		-- Delay between jump and highlighting all possible jumps
		highlight = 0,

		-- Delay between jump and automatic stop if idle (no jump is done)
		idle_stop = 10000000,
	},
})

-- Highlight trailing whitespace
local status_ok, trailspace = pcall(require, "mini.trailspace")
if not status_ok then
	return
end

trailspace.setup({
	only_in_normal_buffers = true,
})
