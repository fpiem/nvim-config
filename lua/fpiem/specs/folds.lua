local ufo_config = function()
	vim.o.foldcolumn = "0" -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

	-- Option 3: treesitter as a main provider
	-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
	-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
	require("ufo").setup({
		fold_virt_text_handler = handler,
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	})
end

return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = ufo_config,
	},
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup({
				fill_char = "·",
			})
		end,
		keys = {
			{ "m", "zc", desc = "Close fold under cursor" },
			{ "M", "zo", desc = "Open fold under cursor" },
		},
	},
	{ -- Preview folds without opening them
		"anuvyklack/fold-preview.nvim",
		dependencies = "anuvyklack/keymap-amend.nvim",
		config = function()
			require("fold-preview").setup({})
		end,
	},
}
