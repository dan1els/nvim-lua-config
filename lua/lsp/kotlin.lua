local fn = vim.fn
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local util = require("lspconfig.util")


local root_files = {
  'settings.gradle', -- Gradle (multi-project)
  'settings.gradle.kts', -- Gradle (multi-project)
  'build.xml', -- Ant
  'pom.xml', -- Maven
  'build.gradle', -- Gradle
  'build.gradle.kts', -- Gradle
}

require'lspconfig'.kotlin_language_server.setup{
  autostart = true,
  capabilities = capabilities,
  root_dir = util.root_pattern(unpack(root_files)),
  cmd = {fn.stdpath('data')..'/site/pack/packer/start/kotlin-language-server/server/build/install/server/bin/kotlin-language-server'},
  init_options = {
    -- Enables caching and use project root to store cache data.
    storagePath = util.root_pattern(unpack(root_files))(vim.fn.expand '%:p:h'),
  },
}
