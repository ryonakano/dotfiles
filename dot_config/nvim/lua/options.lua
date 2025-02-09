local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

local options = {
  number = true,
  termguicolors = true, -- enable 24-bit color
  mouse = "",
  list = true,
  listchars = {
    tab = ">-",
    space = ".",
  },
  colorcolumn = "120",
  wildmode = "list:longest", -- shell-like completion
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--------------------------------------------------------------------------------
-- Configure Terminal
--------------------------------------------------------------------------------
map("n", "<Leader>t", "<cmd>belowright new<CR><cmd>terminal<CR>")
map("t", [[<C-\>]], [[<C-\><C-n>]])

-- Make it possible to start typing soon when the terminal opens
autocmd({ "TermOpen" }, {
  command = "startinsert",
})
-- Line numbers are not suitable for terminals
autocmd({ "TermOpen" }, {
  command = "setlocal nonumber",
})

autocmd({ "TermOpen" }, {
  command = "resize 10",
})
