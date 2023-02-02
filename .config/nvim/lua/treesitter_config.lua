require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "diff",
    "dockerfile",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "go",
    "hcl",
    "hocon",
    "html",
    "java",
    "javascript",
    "jq",
    "json",
    "lua",
    "python",
    "ruby",
    "rust",
    "scala",
    "smithy",
    "sql",
    "toml",
    "typescript",
    "vim"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldminlines = 10
