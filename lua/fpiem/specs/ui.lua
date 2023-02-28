local noice_config = function()
	require("noice").setup({
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = false, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		views = {
			cmdline_popup = {
        position = {
          row = 3,
          col = "50%"
        },
				border = {
					style = "none",
					padding = { 1, 1 },
				},
				win_options = {
				  winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				},
			},
      popupmenu = {
        relative = "editor",
        position = {
          row = 6,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "none",
          padding = { 0, 1 },
        },
				win_options = {
				  winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				},
      },
		},
	})
end

return {
	{
		"folke/noice.nvim",
		dependencies = { { "MunifTanjim/nui.nvim" } },
		config = noice_config,
    cond = vim.g.vscode == nil
	},
	{ "stevearc/dressing.nvim" },
}
