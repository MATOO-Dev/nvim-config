vim.g.mapleader = " "

-- keep the screen centered when jumping up/down
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-b>zz")

-- keep screen centered when going to next/previous match
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

--keep screen centered when going to EOF
vim.keymap.set("n", "G", "Gzz")

-- disable highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>noh<cr>")

-- alternative for switching windows
vim.keymap.set("n", "<leader>w", "<c-w>")

-- quit the current buffer
vim.keymap.set("n", "<leader>bq", "<cmd>bd<cr>")

-- place empty line above/below without going into insert mode
vim.keymap.set("n", "<cr>", "o<esc>")
vim.keymap.set("n", "<s-cr>", "O<esc>")

-- go to next/previous buffer with count support
vim.keymap.set("n", "gt", '":<c-u>" .. v:count1 .. "bnext<cr>"', {expr = true})
vim.keymap.set("n", "gT", '":<c-u>" .. v:count1 .. "bprev<cr>"', {expr = true})
