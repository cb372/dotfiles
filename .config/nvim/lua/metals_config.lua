-- From the nvim-metals readme:
--
-- vim.opt_global.shortmess:remove("F") will do what you need. If you don't
-- know what shortmess is, check out :h shortmess. Without doing this,
-- autocommands that deal with filetypes prohibit messages from being shown, so
-- some of the messages we show to help users get started may not be shown. If
-- you're confident you don't need help setting up, then just remove this, and
-- nvim-metals will work fine, but any log messages won't actually be shown to
-- you if something goes wrong with nvim-metals.
--
-- Not sure why we also need to add "c" - I cargo-culted that from Chris Kipp's
-- example configuration.
vim.opt_global.shortmess:remove("F"):append("c")

local m = require('metals')

vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ws", m.hover_worksheet)
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist) -- all workspace diagnostics
vim.keymap.set("n", "<leader>ae", function() vim.diagnostic.setqflist({severity = "E"}) end) -- all workspace errors
vim.keymap.set("n", "<leader>aw", function() vim.diagnostic.setqflist({severity = "W"}) end) -- all workspace warnings
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist) -- buffer diagnostics only
vim.keymap.set("n", "[c", function() vim.diagnostic.goto_prev({wrap = false}) end)
vim.keymap.set("n", "]c", function() vim.diagnostic.goto_next({wrap = false}) end)

local metals_config = require("metals").bare_config()

metals_config.settings = {
  showImplicitArguments = true,
}

metals_config.init_options.statusBarProvider = "on"

-- Integration with nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
