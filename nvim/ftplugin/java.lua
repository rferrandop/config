local on_attach = function(client, bufr)
    require("config.lsp.keymaps").on_attach(client, bufr)
end

local install_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = os.getenv("HOME") .. "/.cache/jdtls/workspaces/" .. project_name

if vim.fn.has "mac" == 1 then
    OS = "mac"
elseif vim.fn.has "unix" == 1 then
    OS = "linux"
end
local config_dir = install_path .. "/config_" .. OS

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx2g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', install_path .. "/plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar",
        "-configuration",
        config_dir,
        "-data",
        workspace_dir,
    },
    on_attach = on_attach,
    root_dir = vim.fs.dirname(
        vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
    ),
    settings = {
        java = {
            configuration = {
                updateBuildConfiguration = "automatic",
            },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            saveActions = {
                organizeImports = true,
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999;
                    staticStarThreshold = 9999;
                },
            }
        }
    },
}

require("jdtls").start_or_attach(config)
