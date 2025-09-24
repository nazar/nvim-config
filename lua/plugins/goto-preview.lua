return {
  "rmagatti/goto-preview",
  dependencies = { "rmagatti/logger.nvim" },
  event = "BufEnter",
  config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  opts = {
    default_mappings = true,
    references = {
      provider = 'fzf_lua'
    }
  },
}