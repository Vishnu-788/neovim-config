local M = {}

function M.setup()
   local mason_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
   local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
   local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name

   -- Find the launcher jar dynamically
   local launcher_jar = vim.fn.glob(mason_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

   local config = {
      cmd = {
         "/usr/lib/jvm/java-25-amazon-corretto/bin/java",
         "-Declipse.application=org.eclipse.jdt.ls.core.id1",
         "-Dosgi.bundles.defaultStartLevel=4",
         "-Declipse.product=org.eclipse.jdt.ls.core.product",
         "-Dlog.protocol=true",
         "-Dlog.level=ALL",
         "-Xmx1G",
         "--add-modules=ALL-SYSTEM",
         "--add-opens", "java.base/java.util=ALL-UNNAMED",
         "--add-opens", "java.base/java.lang=ALL-UNNAMED",
         "-jar", launcher_jar,
         "-configuration", mason_path .. '/config_linux',
         "-data", workspace_dir,
      },
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
      settings = { java = {} },
      init_options = { bundles = {} },
   }

   require("jdtls").start_or_attach(config)
end

return M
