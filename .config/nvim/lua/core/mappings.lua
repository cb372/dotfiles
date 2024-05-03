-- Change <Leader> (both global and local) from \ to ,
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local map = vim.keymap.set

-- Remap <Ctrl-C> to do the same thing as <Esc>.
-- By default they behave very similarly but not exactly the same.
-- e.g. Ctrl-C does not trigger the 'InsertLeave' event.
map('i', '<C-c>', '<Esc>')

-- Disable arrow keys in insert mode
map('i', '<Left>', '<Nop>')
map('i', '<Right>', '<Nop>')
map('i', '<Up>', '<Nop>')
map('i', '<Down>', '<Nop>')

-- Move between windows without having to press Ctrl-W
map('', '<C-h>', '<C-w>h')
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')

-- ESC or Ctrl-C to get out of terminal-insert mode
map('t', '<ESC>', '<C-\\><C-n>', {noremap = true})
map('t', '<C-c>', '<C-\\><C-n>', {noremap = true})

-- Tab management, set up to mimic tmux mappings
map('n', '<leader>t', '<Cmd>tabnew<CR>', {noremap = true})
map('n', '<leader>an', '<Cmd>tabnext<CR>', {noremap = true})
map('n', '<leader>ap', '<Cmd>tabprev<CR>', {noremap = true})
map('n', '<leader>a!', '<Cmd>tab split<CR>', {noremap = true})
