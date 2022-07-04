-- hybrid number mode
vim.opt.relativenumber = true
vim.opt.number = true

-- Never let the cursor get right to the top/bottom of window
vim.opt.scrolloff = 3

-- make backspace work across line breaks
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- copy/paste directly to/from OSX clipboard (no need to use "+y to copy)
vim.opt.clipboard = 'unnamed'

-- a tab = 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
