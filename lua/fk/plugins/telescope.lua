local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-u', '-g', '!.git' }})<cr>", {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

