return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      ensure_installed = { "go", "lua", "tsx", "jsx", "javascript", "scss", "typescript", "vimdoc", "vue", "vim" },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
  lazy = false,
}
