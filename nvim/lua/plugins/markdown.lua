return {
  {
    "brianhuster/live-preview.nvim",
    config = function()
      require("livepreview.config").set {
        browser = "xdg-open", -- Usa tu navegador por defecto
        user_agent = nil, -- Usa el agente de usuario por defecto
        temporary_dir = nil, -- Usa el directorio temporal del sistema
        highlight = true, -- Habilita el resaltado de sintaxis
        auto_reload = true, -- Auto-recarga al guardar
        keymap = "<localleader>p", -- Mapeo personalizado
        border = "single", -- Estilo del borde
        style = "modern", -- Estilo moderno
        reload_on_tab_change = true, -- Recarga al cambiar de pestaña
      }
    end,
  },
}
