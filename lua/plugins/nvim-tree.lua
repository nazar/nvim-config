return {
  "nvim-tree/nvim-tree.lua",
  dependencies={ "nvim-tree/nvim-web-devicons" },
  config=function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 35,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "File [E]xplorer Toggle" })
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "File Explorer Open and [F]ocus" })
  end
}
