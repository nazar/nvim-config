return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble" },
    opts = {},
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>sT", function() require('fzf-lua').grep({search='TODO|FIXME', no_esc=true}) end,desc = "Todo/Fix/Fixme" },
    },
  }
