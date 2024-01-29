return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = require("plugins.lsp.lua_ls"),
      volar = require("plugins.lsp.volar"),
      vuels = require("plugins.lsp.vuels"),
      tsserver = require("plugins.lsp.tsserver"),
    },
  },
  -- config = function()
  --   require("plugins.lsp.tsserver")
  -- end,
}
