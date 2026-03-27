return {
  -- 1. Apagamos el plugin problemático para que deje de molestar
  { "mxsdev/nvim-dap-vscode-js", enabled = false },

  -- 2. Conectamos Neovim directamente al motor
  {
    "mfussenegger/nvim-dap",
    config = function(plugin, opts)
      -- Dejamos que AstroNvim cargue sus configuraciones y colores base sin romper nada
      ---@diagnostic disable-next-line: redundant-args
      require "astronvim.plugins.configs.nvim-dap"(plugin, opts)

      local dap = require "dap"

      -- Le decimos a Neovim: "Cuando te pidan pwa-node, usa este motor exacto"
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath "data" .. "/mason/bin/js-debug-adapter",
          args = { "${port}" },
        },
      }

      -- === AQUI EMPIEZA LA MAGIA DEL LAUNCH.JSON ===
      local vscode = require "dap.ext.vscode"
      -- Le decimos qué lenguajes van a usar las recetas de JS
      local type_mapping = { ["pwa-node"] = { "javascript", "typescript" } }

      -- 1. Intentamos leer el archivo local del proyecto
      if vim.fn.filereadable ".vscode/launch.json" == 1 then
        vscode.load_launchjs(nil, type_mapping)
      else
        -- 2. Si no existe, buscamos tu Plan B global
        -- vim.fn.stdpath("config") apunta automáticamente a tu carpeta principal de nvim
        local global_launch = vim.fn.stdpath "config" .. "/lua/utils/launch.json"

        if vim.fn.filereadable(global_launch) == 1 then vscode.load_launchjs(global_launch, type_mapping) end
      end
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function(plugin, opts)
      -- 1. Cargamos el diseño bonito que AstroNvim trae por defecto
      require "astronvim.plugins.configs.nvim-dap-ui"(plugin, opts)

      -- 2. Le borramos las órdenes de "cierre automático al terminar"
      local dap = require "dap"
      dap.listeners.before.event_terminated["dapui_config"] = nil
      dap.listeners.before.event_exited["dapui_config"] = nil
    end,
  },
}
