local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  if client.name == 'ruff' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

lspconfig.pyright.setup {
  autostart = true,
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    }
  }
}

lspconfig.ruff.setup {
  autostart = true,
  root_dir = lspconfig.util.find_git_ancestor,
  on_attach = on_attach
}

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
    justMyCode = false;
  },
}
