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
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

