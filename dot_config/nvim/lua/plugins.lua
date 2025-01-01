local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('editorconfig/editorconfig-vim')
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('neoclide/coc.nvim', { ['branch'] = 'release'})
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
vim.call('plug#end')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

require('lualine').setup {
  options = {
    theme = 'OceanicNext'
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'blueprint',
    'vala',
    'lua',
  },
  highlight = {
    enable = true,
  },
}
