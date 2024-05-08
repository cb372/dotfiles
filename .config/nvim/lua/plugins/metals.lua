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
      showImplicitArguments = true,
    }

    metals_config.init_options.statusBarProvider = 'on'

    metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    metals_config.on_attach = function(client, bufnr)
      local map = vim.keymap.set

      map('n', 'gD', vim.lsp.buf.definition, { desc = 'Go to definition' })
      map('n', 'K', vim.lsp.buf.hover)

      --map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Show implementations' })
      map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', { desc = 'Show implementations' })

      --map('n', 'gr', vim.lsp.buf.references, { desc = 'Show references' })
      map('n', 'gr', '<cmd>Telescope lsp_references<CR>', { desc = 'Show references' })

      --map('n', 'gds', vim.lsp.buf.document_symbol, { desc = 'List symbols in document' })
      map('n', 'gds', '<cmd>Telescope lsp_document_symbols<CR>', { desc = 'Search for symbol in document' })

      --map('n', 'gws', vim.lsp.buf.workspace_symbol, { desc = 'Search for symbol in workspace' })
      map('n', 'gws', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'Search for symbol in workspace' })

      map('n', '<leader>l', vim.lsp.codelens.run, { desc = 'Open CodeLens action menu' })
      map('n', '<leader>sh', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
      map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
      map('n', '<leader>sf', vim.lsp.buf.format, { desc = 'Format the current buffer' })
      map('n', '<leader>ac', vim.lsp.buf.code_action, { desc = 'Open code action menu' })
      map('n', '<leader>ws', m.hover_worksheet, { desc = 'Show info about current line of worksheet' })

      map('n', '<leader>aa', vim.diagnostic.setqflist, { desc = 'List all workspace diagnostics' })
      map('n', '<leader>ae', function() vim.diagnostic.setqflist({severity = 'E'}) end, { desc = 'List all workspace errors' })
      map('n', '<leader>aw', function() vim.diagnostic.setqflist({severity = 'W'}) end, { desc = 'List all workspace warnings' })
      map('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = 'List all diagnostics for current buffer' })
      map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic for current line' })
      map('n', '[c', function() vim.diagnostic.goto_prev({wrap = false}) end, { desc = 'Jump to previous diagnostic in buffer' })
      map('n', ']c', function() vim.diagnostic.goto_next({wrap = false}) end, { desc = 'Jump to next diagnostic in buffer' })
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
