local map = vim.keymap.set

vim.g.mapleader = " "

--------------------------------------------------------------------------------
-- Buffer navigation
--------------------------------------------------------------------------------
map("n", "<Leader>n", ":bnext<CR>")
map("n", "<Leader>p", ":bprev<CR>")
map("n", "<Leader>a", ":bfirst<CR>")
map("n", "<Leader>e", ":blast<CR>")
map("n", "<Leader>w", ":bd<CR>")
