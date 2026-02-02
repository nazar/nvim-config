return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig"
  },
  -- config = function()
  --   local mason_path = vim.fn.stdpath "data" .. "/mason/packages/"

  --   require('typescript-tools').setup({
  --     settings = {
  --       tsserver_file_preferences = {
  --         preferTypeOnlyAutoImports = true,
  --         importModuleSpecifierPreference = 'non-relative',
  --       },
  --       jsx_close_tag = {
  --         enable = true,
  --         filetypes = { "javascriptreact", "typescriptreact" },
  --       },
  --       tsserver_plugins = {
  --         {
  --           name = "@mdxjs/typescript-plugin",
  --           path = mason_path .. "mdx-analyzer" .. "/node_modules/@mdx-js/language-server",
  --           filetypes = { "mdx", "typescript" },
  --         }
  --       }
  --     }
  --   })
  -- end,
  opts = {
    --filetypes = { 'angular', 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'mdx' },
    settings = {
      tsserver_file_preferences = {
        preferTypeOnlyAutoImports = true,
        importModuleSpecifierPreference = 'non-relative'
      },
      jsx_close_tag = {
        enable = true,
        filetypes = { "javascriptreact", "typescriptreact" },
      },
      -- tsserver_plugins = {
      --   "@mdx-js/language-server",
      --   -- {
      --   --   name = "@mdxjs/typescript-plugin",
      --   --   -- path = vim.fn.stdpath "data" .. "/mason/packages/" .. "mdx-analyzer" .. "/node_modules/@mdx-js/language-server",
      --   -- filetypes = { "mdx", "typescript" },
      --   -- }
      -- }
    }
  },
}
