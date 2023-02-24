local lsp_zero_config = function()
	local lsp_zero = require("lsp-zero")

	lsp_zero.preset("recommended")

	-- Configure lua language server for neovim
	lsp_zero.nvim_workspace()

	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	local cmp_mappings = lsp_zero.defaults.cmp_mappings({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = vim.NIL,
		["<S-Tab>"] = vim.NIL,
	})

	lsp_zero.set_preferences({
		set_lsp_keymaps = { omit = { "K" } },
	})

	lsp_zero.setup_nvim_cmp({
		sources = {
			{ name = "path" },
			{ name = "nvim_lsp", keyword_length = 1 },
			{ name = "buffer", keyword_length = 3 },
		},
		mapping = cmp_mappings,
	})

	lsp_zero.setup()
end

return {
  {
    "folke/neodev.nvim",
    config = function ()
      require("neodev").setup({})
    end
  },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
		config = lsp_zero_config,
		keys = {
			{ "<leader>lf", ":lua vim.lsp.buf.format()<CR>", desc = "Format document" },
			{ "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", desc = "Show function signature" },
			{ "<leader>lh", ":lua vim.lsp.buf.signature_help()<CR>", desc = "Show hover" },
			{ "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
			{ "<leader>li", ":lua vim.lsp.buf.implementation()<CR>", desc = "List implementations" },
			{ "<leader>lR", ":lua vim.lsp.buf.references()<CR>", desc = "List references" },
			{ "<leader>lT", ":lua vim.lsp.buf.type_definition()<CR>", desc = "Go to type definition" },
			{ "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", desc = "Code actions" },
			{ "gl", ":lua vim.diagnostic.open_float()<CR>", desc = "Show line diagnostics" },
		},
		lazy = false,
	},

	-- Dim unused variables
	{
		"zbirenbaum/neodim",
		event = "LspAttach",
		config = function()
			require("neodim").setup({
				alpha = 0.66,
				hide = {
					signs = false,
				},
			})
		end,
		lazy = false,
	},

	-- Toggling of LSP diagnostics
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		config = function()
			require("toggle_lsp_diagnostics").init({
				virtual_text = false,
			})
		end,
		keys = {
			{ "<leader>ltu", "<Plug>(toggle-lsp-diag-underline)", desc = "Toggle underline" },
			{ "<leader>ltv", "<Plug>(toggle-lsp-diag-vtext)", desc = "Toggle virtual text" },
			{ "<leader>lts", "<Plug>(toggle-lsp-diag-signs)", desc = "Toggle signs" },
		},
		lazy = false,
	},

	-- Scala metals
	{
		"scalameta/nvim-metals",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- TODO: configure this, see https://github.com/scalameta/nvim-metals/discussions/39
	},
}
