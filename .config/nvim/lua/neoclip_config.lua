-- See here for config options and defaults:
-- https://github.com/AckslD/nvim-neoclip.lua#configuration
require('neoclip').setup({
  default_register = '*' -- to match the behaviour of clipboard='unnamed'
})

require('telescope').load_extension('neoclip')
