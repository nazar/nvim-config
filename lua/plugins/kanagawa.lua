return {
  "rebelot/kanagawa.nvim",
  config = function()
    require('kanagawa').setup({
        compile = true,             -- enable compiling the colorscheme
        theme = "wave",              -- Load "wave" theme
    })

    -- setup must be called before loading
    -- vim.cmd("colorscheme kanagawa")
  end,
  build = function()
    vim.cmd("KanagawaCompile")
  end
}