local merge_tables = require("fpiem.utils").merge_tables
local opts = { noremap = true, silent = true }
local create_opts = function(description)
  return merge_tables(opts, { desc = description })
end

-- Set space as the leader
vim.g.mapleader = " "

-- Swap colon and semicolon
vim.keymap.set("n", ":", ";")
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ":", ";")
vim.keymap.set("v", ";", ":")

-- Buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Tab navigation
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", opts)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Faster vertical navigation
vim.keymap.set("n", "J", "}", opts)
vim.keymap.set("n", "K", "{", opts)
vim.keymap.set("v", "J", "}", opts)
vim.keymap.set("v", "K", "{", opts)

-- Splits
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", create_opts("Split vertically"))
vim.keymap.set("n", "<leader>h", ":split<CR>", create_opts("Split horizontally"))

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Window manipulation
vim.keymap.set("n", "<leader>wv", "<C-w>v", create_opts("Split vertically"))
vim.keymap.set("n", "<leader>wh", "<C-w>h", create_opts("Split horizontally"))
vim.keymap.set("n", "<leader>wq", "<C-w>q", create_opts("Close window"))
vim.keymap.set("n", "<leader>w=", "<C-w>=", create_opts("Equalize window size"))

vim.keymap.set("n", "<leader>R", ":lua require('fpiem.utils').toggleLineNumbers()<CR>", { desc = "Toggle relative/absolute line numbers" })

-- TODO: see theprimeagen's remaps
