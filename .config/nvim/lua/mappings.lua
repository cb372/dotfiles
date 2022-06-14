-- Change <Leader> (both global and local) from \ to ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Remap <Ctrl-C> to do the same thing as <Esc>.
-- By default they behave very similarly but not exactly the same.
-- e.g. Ctrl-C does not trigger the "InsertLeave" event.
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable arrow keys in insert mode
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")

-- Move between windows without having to press Ctrl-W
vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-k>", "<C-w>k")
vim.keymap.set("", "<C-l>", "<C-w>l")
