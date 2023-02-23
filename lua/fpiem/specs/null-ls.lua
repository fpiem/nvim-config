local null_ls_config = function()
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
	local formatting = require("null-ls").builtins.formatting
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
	local diagnostics = require("null-ls").builtins.diagnostics

	require("null-ls").setup({
		require("null-ls").setup({
			debug = false,
			sources = {
				formatting.autoflake,
				formatting.isort.with({ extra_args = { "--profile", "black", "--line-length", "120" } }),
				formatting.black.with({ extra_args = { "--fast", "--line-length", "120" } }),
				diagnostics.flake8.with({ extra_args = { "--max-line-length", "120" } }),
				diagnostics.mypy,

				-- Lua
				formatting.stylua,

				-- JS
				formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
			},
		}),
	})
end

return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = null_ls_config,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({})
		end,
	},
}
