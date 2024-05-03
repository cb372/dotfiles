return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.tsserver.setup({})
    lspconfig.rust_analyzer.setup({})
  end
}
