return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      -- A list of parser names, or 'all'
      ensure_installed = {
        'bash',
        'c',
        'css',
        'diff',
        'dockerfile',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'hcl',
        'hocon',
        'html',
        'java',
        'javascript',
        'jq',
        'json',
        'kotlin',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'ruby',
        'rust',
        'scala',
        'smithy',
        'sql',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
    }

    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldminlines = 10
  end,
}
