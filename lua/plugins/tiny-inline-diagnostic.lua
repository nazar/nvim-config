return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup({
      options = {
        -- multilines = {
        --   enabled = true,
        -- },
        show_source = {
            enabled = true,
        },
      },
    })

    -- vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
  end
}
