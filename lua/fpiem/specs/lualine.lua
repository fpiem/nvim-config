local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local lualine_config = function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			disabled_filetypes = { "alpha", "dashboard", "Outline" },
			always_divide_middle = true,
			component_separators = "|",
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = {
			lualine_a = {
				{ "mode", separator = { left = "" }, right_padding = 2 },
			},
			lualine_b = { branch, diff },
			lualine_c = { { "aerial" } },
			lualine_x = { spaces, "encoding", filetype },
			lualine_y = { diagnostics },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
		tabline = {},
		extensions = {},
	})
end

return {
	{
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = lualine_config,
	},
}
