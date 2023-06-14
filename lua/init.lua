require('plugins')
require('pluginSettings')
require('hotkeys')
require('colorScheme')
require('debugmode')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = false,
  }
)

vim.lsp.handlers["document/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = false,
  }
)
