vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Disable Arrow Keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

vim.keymap.set("n", "<c-j>", ":m+1<cr>")
vim.keymap.set("n", "<c-k>", ":m-2<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move tab
vim.keymap.set("n", "<leader>tn", ":+tabm<cr>")
vim.keymap.set("n", "<leader>tp", ":-tabm<cr>")

-- alternate file
vim.keymap.set("n", "<leader>af", ":e #<cr>")

