return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      local session_component = status.component.builder {
        {
          provider = function()
            local ok, resession = pcall(require, "resession")
            if not ok then return "" end

            -- 1. Cazamos la caja con toda la información de golpe
            local info = resession.get_current_session_info()

            -- 2. Si no hay caja (no hay sesión cargada), no mostramos nada
            if not info then return "" end

            -- 3. Sacamos el tipo ("session" o "dirsession") y el nombre ("mi_proyecto")
            local tipo = info.dir
            local nombre = info.name

            -- 4. Lo juntamos todo con el icono del disquete
            return "  " .. tipo .. ": " .. nombre .. " "
          end,
        },
        -- Tu color pastel impecable
        hl = { fg = "#232634", bg = "#99d1db", bold = true },
      }

      -- Lo inyectamos en la parte derecha de la barra
      table.insert(opts.statusline[3], 1, session_component)

      return opts
    end,
  },
}
