local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

--Numeric
opt.number = true
opt.relativenumber = true

--Colors
opt.termguicolors = true
opt.background = "light"

--Swp files
vim.opt.swapfile = false

--Tabs
opt.expandtab = true
opt.tabstop = 3
opt.shiftwidth = 3

--Disable mouse
opt.mouse = ""

--Autoclose
require("autoclose").setup()

--Folding
vim.cmd ([[
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END
]])
