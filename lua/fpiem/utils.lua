local M = {}

M.merge_tables = function(table1, table2)
	for k, v in pairs(table2) do
		table1[k] = v
	end
	return table1
end

M.dump_table = function(tab)
	if type(tab) == "table" then
		local table_string = "{ "
		for k, v in pairs(tab) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			table_string = table_string .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return table_string .. "} "
	else
		return tostring(tab)
	end
end

M.toggleLineNumbers = function()
	if vim.o.relativenumber == true then
		vim.o.number = true
		vim.o.relativenumber = false
	else
		vim.o.relativenumber = true
		vim.o.number = false
	end
end

return M
