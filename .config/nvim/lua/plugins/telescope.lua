return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-fzf-native.nvim',
    'AckslD/nvim-neoclip.lua',
  },
  config = function()
    local tele = require('telescope')
    local actions = require('telescope.actions')

    tele.load_extension('fzf')
    tele.load_extension('neoclip')

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', 't*', builtin.grep_string)
    vim.keymap.set('n', 'tc', builtin.command_history)
    vim.keymap.set('n', 'tf', builtin.find_files)
    vim.keymap.set('n', 'tg', builtin.live_grep)
    vim.keymap.set('n', 'th', builtin.help_tags)
    vim.keymap.set('n', 'tm', builtin.keymaps)
    vim.keymap.set('n', 'to', builtin.oldfiles)
    vim.keymap.set('n', 'tr', builtin.registers)
    vim.keymap.set('n', 'ts', builtin.search_history)
    vim.keymap.set('n', 'tt', builtin.builtin)
    vim.keymap.set('n', 'ty', tele.extensions.neoclip.default)
  end,
}
