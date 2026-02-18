local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      os.getenv("HOME") .. "/.local/share/nvim/mason/bin/pwa-node-adapter",
      "--debug=${port}",
    },
  },
}

dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch Vitest",
    autoAttachChildProcesses = true,
    runtimeExecutable = "node",
    runtimeArgs = {
      "${workspaceFolder}/node_modules/vitest/vitest.mjs",
      "--inspect-brk",
      "${file}",
    },
    skipFiles = {
      "<node_internals>/**",
      "**/node_modules/**",
    },
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
  },
}
