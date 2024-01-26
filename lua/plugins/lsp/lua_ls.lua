return {
  single_file_support = true,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
      -- telemetry = { enable = false },
      -- diagnostics = {
      --   globals = { "vim" },
      -- },
    },
  },
}
