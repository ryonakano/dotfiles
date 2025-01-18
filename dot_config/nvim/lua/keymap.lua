local map = vim.keymap.set

vim.g.mapleader = " "

--[[----------------------------------------------------------------------------
Buffer navigation
----------------------------------------------------------------------------]]--
map("n", "<C-n>", ":bnext<CR>")
map("n", "<C-p>", ":bprev<CR>")
map("n", "<C-a>", ":bfirst<CR>")
map("n", "<C-e>", ":blast<CR>")
map("n", "<C-q>", ":bd<CR>")
