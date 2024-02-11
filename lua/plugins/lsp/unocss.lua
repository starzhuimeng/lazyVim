return {
  root_dir = function(...)
    local util = require("lspconfig.util")
    return util.root_pattern("*")(...)
  end,
  filetypes = { "css", "scss", "less" },
}
