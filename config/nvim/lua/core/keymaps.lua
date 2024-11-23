local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

--Esc alternative
map('i', 'jk', '<Esc>', {noremap = true})
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Bar bar
map('n', 't', '<Cmd>BufferNext<CR>', opts)
map('n', 'z', '<Cmd>BufferClose<CR>', opts)

--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
