local neo_tree_config = function()
	require("neo-tree").setup({
		default_component_configs = {
			close_if_last_window = true,
		},
		window = {
			width = 35,
			mappings = {
				["<space>"] = "noop",
				["l"] = "open",
				["w"] = "open_with_window_picker",
				["h"] = "close_node",
			},
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_gitignored = false,
			},
			follow_current_file = true,
		},
	})
end

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				config = function()
					require("window-picker").setup({})
				end,
			},
		},
		config = neo_tree_config,
		keys = {
			{ "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
		},
		lazy = false,
	},
}
