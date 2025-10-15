return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "astro", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "css", "scss", "sql", "dockerfile", "gitignore", "json", "jsonc", "markdown", "pem", "graphql", "tsx", "yaml" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        indent = true,
        keymaps = {
          init_selection = "<M-Up>", -- set to `false` to disable one of the mappings M is alt key
          node_incremental = "<M-Up>",
          scope_incremental = false,
          node_decremental = "<M-Down>",
        },
      }
    })
  end
}
