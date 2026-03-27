return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

  -- Cargamos la extensión al arrancar
  config = function() require("telescope").load_extension "file_browser" end,

  -- Definimos las teclas aquí (Lazy se encarga del mapeo)
  keys = {
    -- 1. Espacio + f + d (minúscula) -> Navegador en carpeta actual
    {
      "<leader>fd",
      function()
        require("telescope").extensions.file_browser.file_browser {
          path = "%:p:h",
          select_buffer = true,
        }
      end,
      desc = "File Browser (Carpeta Actual)",
    },

    -- 2. Espacio + f + D (MAYÚSCULA/Shift+d) -> Input de ruta absoluta -> CD -> Navegador
    {
      "<leader>fD", -- Esto es Espacio + f + Shift+d
      function()
        -- Esta es la llamada exacta que usa el repo para sacar la barra
        vim.ui.input({
          prompt = "Change Directory to  : ", -- Texto del prompt
          completion = "dir", -- Activa el autocompletado de rutas del sistema
        }, function(input)
          -- Si el usuario cancela (Esc) o lo deja vacío
          if not input or input == "" then return end

          -- Expandimos ~ a la ruta real de home
          local new_path = vim.fn.expand(input)

          -- Validamos que sea un directorio real
          if vim.fn.isdirectory(new_path) == 0 then
            vim.notify("❌ Ruta no válida: " .. new_path, vim.log.levels.ERROR)
            return
          end

          -- 1. Cambiamos el directorio de Neovim
          vim.cmd("cd " .. new_path)
          vim.notify("📂 Directorio cambiado a: " .. new_path, vim.log.levels.INFO)

          -- 2. Abrimos el File Browser en la nueva ruta
          require("telescope").extensions.file_browser.file_browser {
            path = new_path,
            select_buffer = true,
          }
        end)
      end,
      desc = "Change Directory (Absolute)",
    },
  },
}
