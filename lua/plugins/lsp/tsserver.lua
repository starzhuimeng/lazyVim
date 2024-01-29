local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  require("completion").on_attach()

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gc", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
end

local ts_utils_on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  local ts_utils = require("nvim-lsp-ts-utils")

  ts_utils.setup({
    import_all_timeout = 15000,
    import_all_select_source = true,

    eslint_enable_code_actions = true,
    eslint_enable_disable_comments = true,
    eslint_bin = "eslint_d",
    eslint_enable_diagnostics = true,

    filter_out_diagnostics_by_code = { 80001 },
  })

  ts_utils.setup_client(client)
end
return {
  cmd = { "yarn", "typescript-language-server", "--stdio" },
  on_attach = ts_utils_on_attach,
  init_options = {
    plugins = {
      {
        name = "typescript-svelte-plugin",
      },
    },
  },
}
-- local lspconfig = require("lspconfig")
-- lspconfig.tsserver.setup()
