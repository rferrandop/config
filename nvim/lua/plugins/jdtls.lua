-- Load any .env files you find in a project
local load_env = function()
  local env_file = vim.fn.findfile(".env")
  local env_key, env_val
  if env_file:match("env") then
    for _, line in ipairs(vim.fn.readfile(env_file)) do
      env_key = line:match("([A-Z_]+)=")
      env_val = line:match("=(.+)")
      -- Expand env vars
      for name in env_val:gmatch("$([A-Z_]+)") do
        env_val, _ = env_val:gsub("$" .. name, vim.env[name])
      end
      vim.env[env_key] = env_val
    end
    print("Loaded .env file")
  end
end

local grp = vim.api.nvim_create_augroup("nvim_config", { clear = true })
vim.api.nvim_create_autocmd("DirChanged", {
  group = grp,
  callback = load_env,
})

load_env()

return {
  {
    "mfussenegger/nvim-jdtls",
    ---@type lspconfig.options.jdtls
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      jdtls = function(opts)
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        local jvmArg = "-javaagent:" .. install_path .. "/lombok.jar"
        table.insert(opts.cmd, "--jvm-arg=" .. jvmArg)
        table.insert(opts.cmd, "--jvm-arg=" .. "-Xmx2G")

        local settings = {
          java = {
            autobuild = {
              enabled = true,
            },
            maven = {
              downloadSources = true,
            },
            sources = {
              organizeImports = {
                starThreshold = 999,
                staticStarThreshold = 999,
              },
            },
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-21",
                  path = "~/.jenv/versions/21.0.1/",
                },
              },
            },
          },
        }
        opts.settings = settings
        return opts
      end,
    },
  },
}
