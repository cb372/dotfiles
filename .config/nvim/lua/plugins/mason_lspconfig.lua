return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

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

    map('n', '<leader>aa', vim.diagnostic.setqflist, { desc = 'List all workspace diagnostics' })
    map('n', '<leader>ae', function() vim.diagnostic.setqflist({severity = 'E'}) end, { desc = 'List all workspace errors' })
    map('n', '<leader>aw', function() vim.diagnostic.setqflist({severity = 'W'}) end, { desc = 'List all workspace warnings' })
    map('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = 'List all diagnostics for current buffer' })
    map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic for current line' })
    map('n', '[c', function() vim.diagnostic.goto_prev({wrap = false}) end, { desc = 'Jump to previous diagnostic in buffer' })
    map('n', ']c', function() vim.diagnostic.goto_next({wrap = false}) end, { desc = 'Jump to next diagnostic in buffer' })
  end
}
