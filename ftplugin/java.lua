local fn = vim.fn
local plugins_install_path = fn.stdpath('data')..'/site/pack/packer/start'
local jdtls_bin = plugins_install_path..'/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'

local jdtls = require('jdtls')
local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)

local workspace_folder = "/Users/ruaryec/.jdtls_workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local java = vim.env.JAVA_HOME

-- collecting bundles
-- java debug
local bundles = {
  plugins_install_path..'/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar',
}
-- vscode test
vim.list_extend(bundles, vim.split(vim.fn.glob(plugins_install_path..'/vscode-java-test/server/*.jar', 1), "\n"))

local config = {
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
    bundles = bundles 
  }
}

config.on_attach = function(client, bufnr)
  jdtls.setup.add_commands()
  local opts = { silent = true, buffer = bufnr }
  vim.keymap.set('n', "<A-o>", jdtls.organize_imports, opts)
  vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
  vim.keymap.set('n', "<leader>dd", jdtls.test_nearest_method, opts)
  vim.keymap.set('n', "xv", jdtls.extract_variable, opts)
  vim.keymap.set('v', 'xm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
  vim.keymap.set('n', "xc", jdtls.extract_constant, opts)
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
config.capabilities = capabilities

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
    timeout = 60000;
  },
}

vim.g['test#custom_strategies'] = { 
  dapDebug = function() 
    require'dap'.continue()
  end
}

vim.api.nvim_create_user_command('DebugNearest', function()
  vim.g["test#java#gradletest#options"] = '--debug-jvm'
  vim.cmd("TestNearest")
  vim.g["test#java#gradletest#options"] = ''
end,{})

local install_path = fn.stdpath('data')..'/site/pack/packer/start/'
require'formatter'.setup{
  filetype = {
    java = {
      function()
        return {
          exe = 'java',
          args = { '-jar', install_path .. 'google-java-format/core/target/google-java-format-HEAD-SNAPSHOT-all-deps.jar', '-a --skip-reflowing-long-strings', vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    }
  }
}


