return {
  -- 1. Keymaps globales de AstroNvim
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          -- Tu único atajo global para abrir Oil
          ["<Leader><C-n>"] = {
            "<cmd>Oil<CR>",
            desc = "Abrir explorador Oil",
          },
        },
      },
    },
  },

  -- 2. Configuración principal de Oil
  {
    "stevearc/oil.nvim",
    dependencies = {
      { "nvim-mini/mini.icons", opts = {} },
    },
    lazy = false,

    opts = function()
      return {
        default_file_explorer = true,

        -- 🌟 LA MAGIA PARA LAS SESIONES:
        -- Apaga la auto-limpieza. Esto hace que los buffers de Oil sean constantes
        -- y el gestor de sesiones de AstroNvim los pueda guardar y restaurar.
        cleanup_delay_ms = false,

        columns = {
          "icon",
        },

        view_options = {
          show_hidden = true,
        },

        win_options = {
          signcolumn = "yes:2",
        },

        -- Barra superior con nombre del directorio
        winbar = "%#Bold#    %{fnamemodify(v:lua.require('oil').get_current_dir(), ':h:t')} ",

        -- Atajos internos de Oil muy básicos
        keymaps = {
          ["<CR>"] = "actions.select", -- abrir archivo o entrar en directorio

          -- 🌟 TU NUEVA REGLA PARA LA "l"
          ["l"] = {
            desc = "Abrir archivo en panel de código",
            callback = function()
              local oil = require "oil"
              local entry = oil.get_cursor_entry()

              -- 1. Si no hay nada bajo el cursor, no hacemos nada
              if not entry then return end

              -- 2. Si es una carpeta, entramos en ella en el mismo panel
              if entry.type == "directory" then
                oil.select()
                return
              end

              -- 3. Si es un archivo, buscamos si ya existe una ventana que NO sea Oil
              local panel_codigo = nil

              -- Revisamos todas las ventanas abiertas en esta pestaña
              for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                local buf = vim.api.nvim_win_get_buf(win)
                -- Si el tipo de archivo de esa ventana no es "oil", ¡es nuestra ventana de código!
                if vim.bo[buf].filetype ~= "oil" then
                  panel_codigo = win
                  break -- Paramos de buscar
                end
              end

              -- 4. Tomamos la decisión
              if panel_codigo then
                -- Si encontramos un panel de código, sacamos la ruta completa del archivo...
                local dir = oil.get_current_dir()
                local ruta_archivo = dir .. entry.name

                -- ...saltamos a ese panel y abrimos el archivo ahí
                vim.api.nvim_set_current_win(panel_codigo)
                vim.cmd("edit " .. vim.fn.fnameescape(ruta_archivo))
              else
                -- Si no había ningún panel de código (solo paneles de Oil), partimos la pantalla
                oil.select { vertical = true }
              end
            end,
          },
          ["h"] = "actions.parent", -- salir al directorio padre
          ["q"] = "actions.close", -- cerrar oil

          -- mantener navegación entre splits
          ["<C-h>"] = "<C-w>h",
          ["<C-j>"] = "<C-w>j",
          ["<C-k>"] = "<C-w>k",
          ["<C-l>"] = "<C-w>l",

          ["-"] = "actions.parent",
        },
      }
    end,
  },
}
