local vim = vim

--------------------------------------------------------------------------------
-- Load plugins
--------------------------------------------------------------------------------
local Plug = vim.fn["plug#"]
vim.call("plug#begin")
-- dependencies
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-lua/plenary.nvim")
Plug("MunifTanjim/nui.nvim")

-- plugins
Plug("nvim-neo-tree/neo-tree.nvim")
Plug("neoclide/coc.nvim", { ["branch"] = "release"})
Plug("akinsho/bufferline.nvim", { ["tag"] = "*" })
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate"})
vim.call("plug#end")

--------------------------------------------------------------------------------
-- Setup neo-tree
--------------------------------------------------------------------------------
-- Disable netrw in favor of neo-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      -- Show hidden files
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
}

--------------------------------------------------------------------------------
-- Setup bufferline
--------------------------------------------------------------------------------
require("bufferline").setup {
  options = {
    diagnostics = "coc",
  },
}

--------------------------------------------------------------------------------
-- Setup lualine
--------------------------------------------------------------------------------
require("lualine").setup {
  options = {
    theme = "OceanicNext",
  },
}

--------------------------------------------------------------------------------
-- Setup nvim-treesitter
--------------------------------------------------------------------------------
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "blueprint",
    "vala",
    "lua",
  },
  highlight = {
    enable = true,
  },
}
