return {
  root_dir = function(...)
    local util = require("lspconfig.util")
    return util.root_pattern("vite.config.ts")(...)
  end,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "uts", "uvue" },
  settings = {
    volar = {
      codeLens = {
        references = true,
        pugTools = true,
        scriptSetupTools = true,
      },
      takeOverMode = {
        extension = "Vue.volar",
      },
    },
  },
}
