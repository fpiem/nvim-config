-- Bubbles config for lualine
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

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

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "neo-tree" },
		always_divide_middle = true,
    component_separators = '|',
    section_separators = { left = '', right = '' },
	},
	sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
		lualine_b = { branch, diff },
		lualine_c = {{  "aerial" } },
		lualine_x = { spaces, "encoding", filetype },
		lualine_y = { diagnostics },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
	},
	tabline = {},
	extensions = {},
})
