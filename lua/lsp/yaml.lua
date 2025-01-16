require("lspconfig").helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        enabled = false,
        path = "yaml-language-server",
      }
    }
  }
}
require("lspconfig").yamlls.setup{
  filetypes = { 'yml', "yaml", "yaml.docker-compose", "yaml.gitlab" },
  filetypes_exclude = { "helm" },
  cmd = { "yaml-language-server", "--stdio" },
  settings = {
    yaml = {
        hover = true,
        format = {
            enable = true,
            singleQuote = true,
        },
        completion = true,
        validate = true,
    },
  }
}
