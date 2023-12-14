local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup {
  autostart = true,
  capabilities = capabilities
}

lspconfig.ruff_lsp.setup {
  autostart = true,
}

venv_selector = require("venv-selector")

venv_selector.setup({
	changed_venv_hooks = { venv_selector.hooks.pyright }
})

require('dap-python').setup()

--debug remote (move to the project settings)
local dap = require('dap')
dap.configurations.python = {
  {
    type = 'python';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5678;
    timeout = 60000;
  },
}


vim.cmd("LspStart")
