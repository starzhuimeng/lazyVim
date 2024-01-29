return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  config = function()
    require("nvim-treesitter.configs").setup({
      context_commentstring = {
        enable_autocmd = false,
        enable = true,
      },
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { "lua", "tsx", "javascript", "scss", "typescript", "vue", "vim" },
    })
  end,
}
