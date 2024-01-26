return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = require("plugins.lsp.lua_ls"),
      volar = require("plugins.lsp.volar"),
      vuels = require("plugins.lsp.vuels"),
    },
  },
}
