return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          -- Sobrescribimos el atajo <Leader>ff
          ["<Leader>ff"] = {
            function()
              -- 1. Preparamos unas opciones vacías por defecto
              local opciones = {}

              -- 2. Comprobamos si estamos justo encima de un panel de Oil
              if vim.bo.filetype == "oil" then
                -- Sacamos la ruta (Snacks la entenderá sea Windows o Linux)
                local ruta_oil = require("oil").get_current_dir()

                -- Si la ruta existe, le decimos al buscador que empiece a buscar desde ahí
                if ruta_oil then opciones.cwd = ruta_oil end
              else
                local ruta = vim.fn.expand "%:p:h"

                if ruta then opciones.cwd = ruta end
              end

              -- 3. Lanzamos el buscador de archivos de Snacks con las opciones calculadas
              require("snacks").picker.files(opciones)
            end,
            desc = "Find files (usa ruta de Oil si está activo)",
          },
        },
      },
    },
  },
}
