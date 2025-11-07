-- From treesitter-textobject. see: https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#text-objects-move

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- Move Lines
vim.keymap.set("n", "<S-D-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<S-D-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<S-D-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<S-D-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<S-D-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<S-D-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- do not send deletes to buffer
vim.keymap.set({ 'n', 'v' }, '<Del>', '"_x') -- don't copy delete to clipboard, instead use x to cut
vim.keymap.set({ 'n', 'v' }, 'd', '"_d')     -- same, don't copy d based deletes to clipboard, only x gets copied to clipboard
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')     -- same, don't copy c based deletes to clipboard, only x gets copied to clipboard
-- vim.keymap.set({ 'n', 'v' }, 'p', '"_p')     -- same, don't copy c based deletes to clipboard, only x gets copied to clipboard
-- vim.keymap.set({ 'n', 'v' }, 'P', '"_p')     -- same, don't copy c based deletes to clipboard, only x gets copied to clipboard

-- LSP related
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc="Open Diagnostics in Float" })
-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- for spell checking, source: https://github.com/kamykn/spelunker.vim
vim.g.enable_spelunker_vim = 1
vim.g.enable_spelunker_vim_on_readonly = 0
vim.g.spelunker_check_type = 2
vim.g.spelunker_disable_uri_checking = 1
vim.g.spelunker_disable_email_checking = 1
vim.g.spelunker_disable_account_name_checking = 1
vim.g.spelunker_disable_acronym_checking = 1
--vim.g.spelunker_disable_backquoted_checking = 1
-- vim.cmd([[
-- augroup spelunker
--   autocmd!
--   " Setting for g:spelunker_check_type = 1:
--   autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md,*.tsx,*.ts call spelunker#check()

--   " Setting for g:spelunker_check_type = 2:
--   autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md,*.tsx,*.ts call spelunker#check_displayed_words()
-- augroup END
-- ]])
-- vim.g.spelunker_spell_bad_group = "SpelunkerSpellBad"
-- vim.g.spelunker_complex_or_compound_word_group = "SpelunkerComplexOrCompoundWord"

-- https://github.com/mg979/vim-visual-multi/wiki/Mappings
vim.g.VM_maps = {}
vim.g.VM_maps["Add Cursor Up"] = 'C-S-Up'
vim.g.VM_maps["Add Cursor Down"] = 'C-S-Down'

-- Override highlight setting with Error color from the current theme.
local error_color = vim.fn.synIDattr(vim.fn.hlID("Error"), "fg")
vim.cmd(string.format("highlight SpelunkerSpellBad cterm=underline gui=undercurl guisp=%s", error_color))
vim.cmd(
  string.format(
    "highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=undercurl guisp=%s",
    error_color
  )
)

-- own overrides
-- find myself hitting cmd-w in insert mode to save - override to save - ctrl-o to enter single command mode
vim.keymap.set("i", "<D-s>", "<C-o><cmd>w<cr>", { desc = "Quick save in Insert mode" })
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Quick save in Normal mode" })
-- duplicate line
vim.keymap.set("i", "<D-d>", "<C-o>yy<C-o>p", { desc = "Quick duplicate in Insert mode" })
vim.keymap.set("n", "<D-d>", "yyp", { desc = "Quick duplicate in Normal mode" })
-- replace surrounding single quotes with double quotes
vim.api.nvim_set_keymap("n", "<D-S-2>", [[sr'"]], { desc = "Quick change single quotes to double quotes" })
vim.api.nvim_set_keymap("i", "<D-S-2>", [[<esc>sr'"i]], { desc = "Quick change single quotes to double quotes" })

-- indent without losing visual block mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true, desc = "Toggle UndoTree" })

-- highlight without moving cursor
vim.keymap.set("n", "<F8>", "*``", { desc = "Highlight word on cursor without moving" })
