local vim = vim
local map = vim.keymap.set

--------------------------------------------------------------------------------
-- Load plugins
--------------------------------------------------------------------------------
vim.pack.add {
  -- dependencies
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },

  -- plugins
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/EdenEast/nightfox.nvim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },

  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
}

--------------------------------------------------------------------------------
-- Setup neo-tree
--------------------------------------------------------------------------------
-- Disable netrw in favor of neo-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup {
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
}

map("n", "<Leader>e", ":Neotree toggle<CR>")

--------------------------------------------------------------------------------
-- Setup bufferline
--------------------------------------------------------------------------------
require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "neo-tree",
        text = "󰥨 File Explorer",
        text_align = "left",
        separator = true,
      }
    },
  },
}

map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprev<CR>")
map("n", "<Leader>w", ":bd<CR>")

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
-- Originally from: https://zeta.ws/nvim/#4-nvim-treesitter-シンタックスハイライト
--------------------------------------------------------------------------------
-- 1. Install parsers
require("nvim-treesitter").install {
  "bitbake",
  "c",
  "lua",
  "qmljs",
  "vala",
}
-- 2. Enable highlight
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    -- 2-1. Get language name for tree-sitter from FileType
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then
      -- Early return if no corresponding language found
      return
    end

    -- 2-2. Check if the parser of the language is actually available
    local parser = vim.treesitter.get_parser(args.buf, lang)
    if not parser then
      -- Early return if no parser found
      return
    end

    vim.treesitter.start(args.buf, lang)
  end,
})

--------------------------------------------------------------------------------
-- Setup LSP
--------------------------------------------------------------------------------
-- Languages that we want to enable LSP without mason-lspconfig
local lsp_manual_list = {
  -- mason-lspconfig tries to build vala-language-server from source, which requires development packages for it.
  -- So we assume it's installed via apt instead.
  "vala_ls",
  -- mason-lspconfig does not know how to map this
  "bitbake_language_server",
  -- mason-lspconfig does not know how to map this
  "blueprint_ls",
}
vim.lsp.config("*", {})
vim.lsp.enable(lsp_manual_list)

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "lua_ls",
    "rust_analyzer",
  },
}

--------------------------------------------------------------------------------
-- Setup completion without plugins
-- Originally from: https://zeta.ws/nvim/#自動補完プラグインなしのネイティブ構成
--------------------------------------------------------------------------------
vim.opt.completeopt = {
  "menuone",  -- Present candidates menu even if one candidate
  "noselect", -- Do not automatically select the first candidate when the menu appears
  "noinsert", -- Do not automatically insert the candidate to the buffer just by selecting it
}
-- Enable completion for all languages when all LSP is attached
-- See also:
-- - https://zeta.ws/nvim/#すべての言語で一括設定
-- - https://neovim.io/doc/user/lsp/#lsp-attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    -- Check if the LSP has completion feature
    if client:supports_method("textDocument/completion") then
      -- Enable neovim-native completion
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

--------------------------------------------------------------------------------
-- Setup nightfox
--------------------------------------------------------------------------------
vim.cmd("colorscheme nightfox")

--------------------------------------------------------------------------------
-- Setup gitsigns
--------------------------------------------------------------------------------
require("gitsigns").setup()
