local status_ok, swenv = pcall(require, "swenv")
if not status_ok then
	return
end

local is_home_dir = function()
	return vim.fn.getcwd(0) == vim.fn.expand("$HOME")
end

-- TODO: envinonment names, currently set to ""
-- TODO2: add conda envs
local get_python_interpreters = function()
	local paths = {}
	local commands = { "which -a python", is_home_dir() and "" or "find . * | grep -P '.*/bin/python3'" }
	for _, cmd in ipairs(commands) do
		local _paths = vim.fn.systemlist(cmd)
		if _paths then
			for _, path in ipairs(_paths) do
				table.insert(paths, path)
			end
		end
	end

	-- Remove duplicates
	local res = {}
	table.sort(paths)
	for i, path in ipairs(paths) do
		if path ~= paths[i + 1] then
      -- TODO: extract names from env folder, then consider adding venv to lualine
			table.insert(res, { name = "", path = path })
		end
	end

	return res
end

swenv.setup({
	get_venvs = function(_)
		return get_python_interpreters()
	end,
	post_set_venv = function(_)
		vim.cmd("LspRestart")
	end,
})

