return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('neo-tree').setup({
        sort_case_insensitive = true,
      })
      vim.keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "File [E]xplorer Toggle" })
      vim.keymap.set("n", "<leader>ef", "<cmd>Neotree focus<CR>", { desc = "File Explorer Open and [F]ocus" })
      vim.keymap.set("n", "<leader>el", "<cmd>Neotree reveal<CR>", { desc = "File Explorer Focus Fi[L]e]" })

      -- vim.cmd("Neotree focus")
    end
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
        window = {
          mappings = {
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = false,
                -- use_image_nvim = true,
                -- use_snacks_image = true,
                -- title = 'Neo-tree Preview',
              },
            },
          }
        }
      })
    end,
  },
}
