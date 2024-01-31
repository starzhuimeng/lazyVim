return {
  "f-person/git-blame.nvim",
  config = function()
    require("gitblame").setup({
      --Note how the `gitblame_` prefix is omitted in `setup`
      enabled = true,
      date_format = "%Y-%m-%d %H:%M:%S %A",
      message_when_not_committed = "还没有提交哦 ⸜(｡˃ ᵕ ˂ )⸝♡",
    })
  end,
}
