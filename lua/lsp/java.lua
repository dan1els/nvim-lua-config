local fn = vim.fn
local plugins_install_path = vim.g.lazy_plugin_path
local jdtls_bin = plugins_install_path..'/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'

local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)

local workspace_folder = "/Users/ruaryec/Developer/.jdtls_workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local java = vim.env.JAVA_HOME

-- collecting bundles
-- java debug
local bundles = {
  plugins_install_path..'/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar',
}
-- vscode test
vim.list_extend(bundles, vim.split(vim.fn.glob(plugins_install_path..'/vscode-java-test/server/*.jar', 1), "\n"))


vim.g['test#custom_strategies'] = {
  dapDebug = function()
    require'dap'.continue()
  end
}

vim.api.nvim_create_user_command('DebugNearest', function()
  vim.g["test#java#gradletest#options"] = '--debug-jvm'
  vim.g["test#java#maventest#options"] = '-Dmaven.surefire.debug'
  vim.cmd("TestNearest")
  vim.g["test#java#gradletest#options"] = ''
  vim.g["test#java#maventest#options"] = ''
end,{})

return {
  flags = {
    debounce_text_changes = 80,
    allow_incremental_sync = true,
  };
  cmd = {
    java..'/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx2g',
    '-javaagent:/Users/ruaryec/.m2/repository/org/projectlombok/lombok/1.18.30/lombok-1.18.30.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
   -- '-jar', jdtls_bin..'/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-jar', jdtls_bin..'/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
    '-configuration', jdtls_bin..'/config_mac',
    '-data', workspace_folder,
  },
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = 'JavaSE-21',
            path = '/Users/ruaryec/.asdf/installs/java/temurin-21.0.3+9.0.LTS',
          },
          {
            name = 'JavaSE-11',
            path = '/Users/ruaryec/.asdf/installs/java/adoptopenjdk-11.0.24+8',
          },
        },
      },
      signatureHelp = { enabled = true };
      contentProvider = { preferred = 'fernflower' };
      sources = {
        organizeImports = {
          starThreshold = 9999;
         staticStarThreshold = 9999;
        };
      };
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
       },
      hashCodeEquals = {
        useJava7Objects = true,
      },
      useBlocks = true,
      };
    };
  },
  init_options = {
    bundles = bundles,
  },
  on_attach = function(client, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}

