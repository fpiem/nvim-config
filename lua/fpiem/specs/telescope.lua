return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        keys = {
            { "<leader>fa", ":lua require('telescope.builtin').find_files()<CR>", desc = "Search all files" },
            { "<leader>fg", ":lua require('telescope.builtin').git_files()<CR>", desc = "Search Git files" },
            { "<leader>fr", ":lua require('telescope.builtin').oldfiles()<CR>", desc = "Search recent files" },
            { "<leader>F", ":lua require('telescope.builtin').live_grep()<CR>", desc = "Live grep" },
        },
        lazy = false
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require "telescope".load_extension("frecency")
        end,
        dependencies = { "kkharji/sqlite.lua" },
        keys = {
            { "<leader>ff", "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>" , desc = "Search f-recent files" },
        },
        lazy = false
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end
    },
    {
        "nvim-telescope/telescope-project.nvim",
        config = function()
            require 'telescope'.load_extension('project')
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
}
