return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    files = {
      cwd_prompt_shorten_len = 16
    },
    keymap = {
      -- adds finder window results to quicklist
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    },
  },
  keys = {
    { "<leader>ff", function() require('fzf-lua').files() end, desc="[F]ind [F]iles in project directory" },
    { "<leader>fc", function() require('fzf-lua').files({ cwd=vim.fn.stdpath("config") }) end, desc="[F]ind [F]iles in neovim config folder" },
    { "<leader>fg", function() require('fzf-lua').live_grep() end, desc="Find by [G]repping current project directory" },
    { "<leader>fb", function() require('fzf-lua').builtin() end, desc="Find [B]uilt commands" },
    { "<leader>fh", function() require('fzf-lua').helptags() end, desc="Find [H]elp" },
    { "<leader>fk", function() require('fzf-lua').keymaps() end, desc="Find [K]eymaps" },
    { "<leader>fw", function() require('fzf-lua').grep_cword() end, desc="Find current [w]ord" },
    { "<leader>fW", function() require('fzf-lua').grep_cWORD() end, desc="Find current [W]ORD" },
    { "<leader>fd", function() require('fzf-lua').diagnostics_document() end, desc="Find [D]iagnostics" },
    { "<leader>fr", function() require('fzf-lua').resume() end, desc="Find [R]esume" },
    { "<leader>fo", function() require('fzf-lua').oldfiles() end, desc="Find [O]ld files" },
    { "<leader>fs", function() require('fzf-lua').git_status() end, desc="Git [S]status" },
    { "<leader>fj", function() require('fzf-lua').jumps() end, desc="[J]umps list" },
    { "<leader>fm", function() require('fzf-lua').marks() end, desc="[M]arks" },
    { "<leader>ft", function() require('fzf-lua').command_history() end, desc="Command His[T]ory" },
    { "<leader>fp", function() require('neoclip.fzf')() end, desc="Cli[P]board History" },
    { "<leader><leader>", function() require('fzf-lua').buffers() end, desc="[ ] Find existing buffers" },
    { "<leader>/", function() require('fzf-lua').lgrep_curbuf() end, desc="[/] Live grep the current buffer" },
  }
}
