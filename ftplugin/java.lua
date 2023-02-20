local fn = vim.fn
local plugins_install_path = fn.stdpath('data')..'/site/pack/packer/start'
local jdtls_bin = plugins_install_path..'/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'

local jdtls = require('jdtls')
local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)

local workspace_folder = "/Users/evgenii/.jdtls_workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- collecting bundles
-- java debug
local bundles = {
  plugins_install_path..'/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.44.0.jar',
}
-- vscode test
vim.list_extend(bundles, vim.split(vim.fn.glob(plugins_install_path..'/vscode-java-test/server/*.jar', 1), "\n"))

local config = {
  flags = {
    debounce_text_changes = 80,
    allow_incremental_sync = true,
  };
  cmd = {
    '/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '-javaagent:/Users/evgenii/.m2/repository/org/projectlombok/lombok/1.18.24/lombok-1.18.24.jar',
    '-Xbootclasspath/a:/Users/evgenii/.m2/repository/org/projectlombok/lombok/1.18.24/lombok-1.18.24.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jdtls_bin..'/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', jdtls_bin..'/config_mac',
    '-data', workspace_folder,
  },
  settings = {
    java = {
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
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = "/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home",
          },
          {
            name = "JavaSE-17",
            path = "/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home",
          },
        }
      };
    };
  },
  init_options = {
    bundles = bundles 
  }
}

config.on_attach = function(client, bufnr)
  jdtls.setup.add_commands()
  local opts = { silent = true, buffer = bufnr }
  vim.keymap.set('n', "<A-o>", jdtls.organize_imports, opts)
  vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
  vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
  vim.keymap.set('n', "xv", jdtls.extract_variable, opts)
  vim.keymap.set('v', 'xm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
  vim.keymap.set('n', "xc", jdtls.extract_constant, opts)
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

jdtls.start_or_attach(config)


--debug remote (move to the project settings)
local dap = require('dap')
dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}
