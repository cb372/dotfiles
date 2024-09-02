--return {
  --"folke/tokyonight.nvim",
  --lazy = false,
  --priority = 1000,
  --config = function()
    --vim.cmd[[colorscheme tokyonight-night]]
  --end
--}
return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd[[colorscheme carbonfox]]
  end
}
