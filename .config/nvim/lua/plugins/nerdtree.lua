return {
  'preservim/nerdtree',
  init = function()
    vim.keymap.set('n', '<C-t>', '<Cmd>NERDTreeFind<CR>', {noremap=true})
  end
}
