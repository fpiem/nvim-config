-- Set space as the leader
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", ":", ";", opts)
vim.keymap.set("n", ";", ":", opts)
vim.keymap.set("v", ":", ";", opts)
vim.keymap.set("v", ";", ":", opts)

-- Buffer navigation
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

