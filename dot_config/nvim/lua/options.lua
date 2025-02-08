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

vim.cmd("colorscheme habamax")
