local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
  autostart = true,
  capabilities = capabilities,
}

vim.cmd("LspStart")
