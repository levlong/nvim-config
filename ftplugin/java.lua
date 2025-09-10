-- Set up workspace folder.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.expand("~/.local/share/nvim/jdtls-workspaces/") .. project_name

-- See `:help vim.lsp.start` for an overview of the supported `config` options.
local config = {
  name = "jdtls",
  -- `cmd` defines the executable to launch eclipse.jdt.ls.
  -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
  cmd = { 
          vim.fn.expand("~/.local/share/jdtls/bin/jdtls"),
          '-data', workspace_dir,
        },
  -- `root_dir` must point to the root of your project.
  -- See `:help vim.fs.root`
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/jdk-17.0.16+8",
            default = true,
          },
        },
      },
      saveActions = {
        organizationImports = true,
      },
      implementationsCodeLens = { enable = true},
      referencesCodeLens = { enable = true },
      format = {
        settings = {
          url = vim.fn.expand("~/.config/nvim/formatter/eclipse-java-google-style.xml"),
          profile = "GoogleStyle",
        },
      },
    },
  },


  -- This sets the `initializationOptions` sent to the language server
  -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
  -- you'll need to set the `bundles`
  --
  -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on any eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
require('jdtls').start_or_attach(config)
