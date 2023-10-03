
local lspconfig = require("lspconfig")
local coq = require('coq')

lspconfig.lua_ls.setup {
  capabilities = coq.lsp_ensure_capabilities(),
  autostart = true,
}

vim.cmd("LspStart")
