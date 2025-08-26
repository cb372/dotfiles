return {
  'scalameta/nvim-metals',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'hrsh7th/cmp-nvim-lsp'
  },
  ft = { 'scala', 'sbt', 'java' },
  opts = function()
    local m = require('metals')
    local metals_config = m.bare_config()

    metals_config.settings = {
      defaultBspToBuildTool = true,
      inlayHints = {
        byNameParameters = { enable = true },
        hintsInPatternMatch = { enable = true },
        implicitArguments = { enable = true },
        implicitConversions = { enable = true },
        inferredTypes = { enable = true },
        typeParameters = { enable = true },
      },
    }

    metals_config.init_options.statusBarProvider = 'on'

    metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    metals_config.on_attach = function(client, bufnr)
      local map = vim.keymap.set

      map('n', '<leader>ws', m.hover_worksheet, { desc = 'Show info about current line of worksheet' })
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = self.ft,
      callback = function()
        require('metals').initialize_or_attach(metals_config)

        local tele = require('telescope')
        tele.load_extension('metals')
        vim.keymap.set('n', 'tq', tele.extensions.metals.commands)
      end,
      group = nvim_metals_group,
    })
  end
}
