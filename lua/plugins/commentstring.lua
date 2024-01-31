return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  config = function()
    require("ts_context_commentstring").setup({
      context_commentstring = {
        enable_autocmd = false,
        enable = true,
      },
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { "lua", "tsx", "javascript", "scss", "typescript", "vue", "vim" },
    })
  end,
}
