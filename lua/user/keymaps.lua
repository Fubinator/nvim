local opts = { noremap = true, silent= true }
local keymap = vim.api.nvim_set_keymap

-- FZF File Browser
keymap("n", "<c-p>", ":Files<cr>", opts)

-- Disable Arrow Keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

keymap("n", "<c-j>", ":m+1<cr>", opts)
keymap("n", "<c-k>", ":m-2<cr>", opts)
