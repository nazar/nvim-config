return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      offsets = {
        {
          filetype = 'neo-tree',
          ext = "File Explorer",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
        }
      }
    }
  }
}